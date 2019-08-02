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

в этом случае метод `awake()`  будет вызыван сразу послу замыкания `connect`. К этому моменту будут внедрены все зависимости, не связанные с `View`.

Дополнительно, все зависимости могут удовлетворять протоколу `ViewObserver`

```swift
public protocol ViewObserver {
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
