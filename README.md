# Diseasy

<img src="https://raw.githubusercontent.com/manhattan98/Diseasy/main/Screenshots/Screenshot%202021-07-07%20at%2010.48.33.png" 
  width="40%">
<img src="https://raw.githubusercontent.com/manhattan98/Diseasy/main/Screenshots/Screenshot%202021-07-07%20at%2010.49.22.png" 
  width="40%">

### Virus spread simulator
iOS app simulate and visualize infection spread over group of subjects.  
Application include two screens: 
* Parameters screen
* Modelling visualization screen

In the initial state there is no infected subjects - all of them are "healthly".  
When user tap on any "healthly" element, he become "infected" and redraws accordingly. During modelling process user can tap on any number of "healthly" elements, i.e. "infecting" them.  
With given frequency T state and number of "infected" subjects recalculates, following screen update.  
Modelling screen support scrolling and zooming.

*Main technologies:* **`UIKit` `GCD`**

----

### Симулятор распространения вируса
iOS приложение симулирует и визуализирует распространение инфекции в группе субъектов.  
Приложение включает два экрана:
* Экран ввода параметров
* Экран визуализации моделирования.

В начальном состоянии в группе нет инфицированных субъектов — все объекты отображаются как "здоровые".  
Если пользователь нажимает на "здоровый" элемент, тот становится "больным" и перерисовывается соответствующим образом. За время работы системы моделирования пользователь может нажимать на неограниченное количество "здоровых" элементов, тем самым "заражая" их.  
С указанной на экране ввода параметров частотой T пересчитывается количество "больных" элементов с последующим обновлением экрана.  
Экран моделирования поддерживает прокрутку и изменение масштаба. 

*Ключевые технологии:* **`UIKit` `GCD`**
