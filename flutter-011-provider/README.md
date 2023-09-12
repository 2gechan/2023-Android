# flutter의 provider

- flutter는 `state` 기반의 뷰모델 패턴을 따라서 작성되는 프로젝트이다.
- `state 변수` 값이 변화가 생기면 화면이 re-Rendering 되는 큰 구조를 가진 프로젝트를 말한다.

## flutter의 state

- state 변수를 선언한 클래스에서는 자유롭게 값을 읽고 쓰고, 변화 시킬 수 있다.
- state 변수는 부모 widget에서 자손 widget으로 전달할 수 있다.
- state 변수는 형제 widget 간에는 전달이 불가능하다.
- state 변수를 형제간에 공유하려면, 부모 widget으로 끌어 올리기를 수행한 후 부모 widget에서 자손 widget으로 전달해야만 읽기가 가능하다.
- 만약 부모 widget에서 전달한 state 변수를 자손 widget에서 변화 시키려면 state를 변화 시킬 수 있는 함수를 전달하여 실행해야 한다.
- flutter 에서도 state(매개변수, 전달값)이 부모에서 자손으로 또 그 자손으로 전달될 때 props drilling 현상이 발생할 수 있다.
- props drlling 현상을 조금이나마 줄이기 위하여 여러가지 도구가 있는데, 그중 flutter 에서 비교적 사용하기 쉬운 provider를 사용하여 적용해 보자.

## flutter의 상태 관리 도구

- Getx : flutter 에서 가장 많이 사용하는 상태도구 인데, BuilderContext 관리가 다소 불편하다.
- Bloc(비즈니스 로직 컴포넌트) : 비동기 환경에 최적화된 도구, 학습 곡선이 다소 높다. Getx 의 단점들을 보완하면서 점점 사용자가 많아지는 추세
- Mobx : React에도 같은 도구가 있고, React 개발자들이 flutter로 전향하면서 많은 사용자가 늘어나고 있다.
- Provider : Getx 다음으로 사용자가 많고, 비교적 학습하는데 유리한 도구, 잘못 사용하면 변수 관리하는 과정에서 메모리 누수(leak)가 발생할 확률이 매우 높다.

## flutter의 MVVM 패턴

- 일반적인 프로젝트에서는 내부에서 사용되는 변수, 화면에 표시하고자 하는 변수들을 개발자가 일일이 모두 챙긴 코드를 다수 작성을 해야한다.
- MVVM 패턴에서는 State를 잘 활용하고, Notify를 잘 활용하여 State의 변화를 자동으로 화면에 반영하는 방법

## View Model

- Dto 클래스와 화면에 rendering을 수행하는 코드가 잘 융합된 형태
