# StoryCode. Storyboards from code

Строго типизированный инструмент внедрения зависимостей для `UIViewController`'ов.

## Использование

Для создания экземпляра `UIViewController` со всеми зависимостями необходимо использовать структуру `Scene`

```swift
let viewController = Scene {
        return UIViewController()
    } .with {
        return FirstDependency()
    } .with {
        return SecondDependency()
    } .instantiante(connect: { viewController, firstDependency, secondDependency in
        /* make any connections */
    }, view: { viewController, firstDependency, secondDependency in
        let view = UIView()
        /* setup view and make any connections with view */
        return view
    })
}
```

`UIViewController` и все зависимости могут удовлетворить протоколу `Awakable`

```swift
protocol Awakable {
    func awake()
}
```

в этом случае метод `awake()`  будет вызыван сразу после замыкания `connect`. К этому моменту будут внедрены все зависимости, не связанные с `View`.

Дополнительно, все зависимости могут удовлетворять протоколу `ViewObserver`

```swift
protocol ViewObserver {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
}
```

в этом случае данные методы будут вызваны вместе с аналогичными методами `UIViewController`'а. Все методы `ViewObserver` имеют пустую реализацию по умолчанию.

## Установка

Carthage: `github "antonsergeev88/StoryCode" ~> 1.0`

CocoaPods: `pod 'StoryCode', '~> 1.0'`

## Для чего нужен StoryCode

### Фабрика `UIViewController`'ов

Распространенная практика в проекте иметь фабрику, которая отдаёт экземпляры `UIViewController`. При использовании `StoryCode` такая фабрика будет выглядеть консистентно при создании каждого экземпляра, это упростит и ускорит работу с кодом, например:

```swift
enum Scenes {
    static func cityDetail(for cityID: City.ID) -> UIViewController {
        return Scene({
            return UIViewController()
        }) .with {
            return Services.cityProvider
        } .with {
            return CityController(cityID)
        } .instantiate(connect: { _, cityProvider, cityController in
            cityController.cityProvider = cityProvider
        }, view: { _, _, cityController in
            let tableView = UITableView()
            tableView.dataSource = cityController
            tableView.delegate = cityController
            return tableView
        })
    }
}
```

В примере выше мы создали простой контроллер с двумя зависимостями. В реальных примерах контроллеры могут быть значительно больше и их количество может достигать сотен, но при использовании `StoryCode` описание каждого из них всегда будет выглядеть одинакого и не придётся тратить время на изучение каждого из них.

`UIViewController`'ы удобно собирать в экраны или даже несколько экранов, например:

```swift
enum Stories {
    static func main() -> UIViewController {
        let cityList = Scene.cityList()
        let cityNavigation = Scene.stackNavigation(root: cityList)
        /*...*/
        let tabNavigation = Scene.arrayNavigation([cityNavigation, ...])
        return tabNavigation
    }
}
```

### Упрощение поддержки

Часто необходимо добавить какой-то функционал в работающий контроллер, например логирование нажатия кнопки. С точки зрения архитектуры такие правки не должны менять существующий код, `StoryCode` позволяет это сделать:

```swift
enum Scenes {
    static func cityDetail(for cityID: City.ID) -> UIViewController {
        return Scene({
            return UIViewController()
        }) /*...*/ .with {
            return Services.logger
        } .instantiate(connect: { /*...*/ }, view: { _, _, cityController, logger in
            /*...*/
            cityController.buttonDidTap.bind { [weak logger] in
                logger?.log(.buttonDitTap)
            }
            return tableView
        })
    }
}
```

### Жизненный цикл `UIViewController`

Обычно для наблюдения за жизненным циклом `View` необходимо в подклассе `UIViewController`'а описать необходимую логику, это со временем приведёт к тому, что подкласс `UIViewController`'а будет слишком большим для его простой поддержки. Можно начать выделять код в отдельные классы, и в коде `UIVieController`'а уведомлять новые объекты о событиях, но это лишь прячет проблему большого `UIViewController`'а за сложным и глубоким графом зависимостей, что в последствии приводит к тем же самым сложностям в поддержке кода.

`StoryCode` вызывает методы жизненного цикла синхронно с аналогичными методами `UIViewController`'а без необходимости написания кода.

### Упрощение графа зависимостей

Благодаря тому, что `StoryCode` позволяет создавать любые графы объектов, становится возможным проектировать объекты в узлах таких графов не нарушая принцип единой ответственности, что делает их простыми в написании и поддержке.  

## Описание

Ключевым элементом фрэймворка является сцена. Сцена - это `UIViewController` со вспомогательными объектами. Жизненный цикл всех объектов синхронизирован, `UIViewController` держит сильные ссылки на все вспомогательные объекты.

Сцена имеет свой жизненный цикл:

- Создание экземпляра `UIViewController`
- Создание всех вспомогательных объектов
- Сохранение вспомогательных объектов в `UIViewController`
- Соединение всех объектов в один граф объектов. Этот шаг пропускается в случае отсутствия замыкания `connect`.
- Вызов метода `awake()` у `UIViewController`'а и всех вспомогательных объектов в случае удовлетворению
- Возвращение готового к использованию `UIViewcontroller`'а

При создании `View` происходит следующая последовательность событий:

- Создаётся `View` с помощью замыкания `view`, переданного в метод `instantiante()`, которая становится корневой для `UIViewController`'а. В случае отсутствия замыкания `view` или в случае переопределения метода `loadView()` `UIViewController`'ом будет использоваться стандартный механизм `UIViewController`'а для создания `view`.
- Затем `UIViewController` и вспомогательные объекты начинают получать события жизненного цикла `UIViewController`'а.

Поддерживается повторное создание `view`

```swift
let viewController = Scene {/* creating scene */}
viewController.loadViewIfNeeded()
viewController.view = nil
viewController.loadViewIfNeeded()
```

после выполнения этого кода `view` будет создана повторно и будут проставлены все связи с ней. Методы жизненного цикла будут приходить в соответствии с логикой `UIViewController`'а. Этим удобно пользоваться для экономии памяти и других ресурсов.
