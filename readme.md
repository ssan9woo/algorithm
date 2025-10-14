## Algorithm

### Week 2542
- String to Integer (atoi)[https://leetcode.com/problems/string-to-integer-atoi/description/]

<br><br>

# 📝 Swift 코딩 테스트 핵심 노트

### 📌 목차
1. [문자열 (String & Character) 처리](#1-문자열-string--character-처리)<br>
    1.1. [Character가 숫자인지 판별](#11-character가-숫자인지-판별)<br>
    1.2. [Character를 Int 정수 값으로 변환](#12-character를-int-정수-값으로-변환)<br>
    1.3. [선행 문자(Prefix) 조건적 제거](#13-선행-문자prefix-조건적-제거)<br>
    1.4. [조건을 만족하는 선행 문자열 추출](#14-조건을-만족하는-선행-문자열-추출)<br>
    1.5. [문자열의 첫 문자 접근 및 제거](#15-문자열의-첫-문자-접근-및-제거)<br>
2. [수학 및 타입 처리](#2-수학-및-타입-처리)<br>
    2.1. [정수 경계 상수 및 타입 변환](#21-정수-경계-상수-및-타입-변환)<br>
    2.2. [산술적 오버플로우/언더플로우 사전 체크](#22-산술적-오버플로우언더플로우-사전-체크)<br>
    2.3. [함수 반환 값 (튜플) 분해](#23-함수-반환-값-튜플-분해)

<br><br>

## 1. 문자열 (String & Character) 처리

### 1.1 Character가 숫자인지 판별

* **관련 메소드:** `Character.isNumber`
* **용도:** 특정 `Character`가 `'0'`부터 `'9'`까지의 아라비아 숫자인지 **빠르고 직관적으로** 판별합니다.
* **사용 시점:** 문자열을 순회하며 숫자 부분만 추출해야 할 때 유용합니다.
* **반환:** `Bool` (`true` 또는 `false`).
* **예시:**
    ```swift
    let char: Character = "7"
    if char.isNumber { 
        print("숫자입니다") 
    }
    ```

<br>

### 1.2 Character를 Int 정수 값으로 변환

* **관련 메소드:** `Character.wholeNumberValue`
* **용도:** `Character`를 해당 아라비아 숫자의 **정수 값**(`Int`)으로 안전하게 변환합니다.
* **사용 시점:** 문자열의 문자를 숫자로 변환하여 산술 연산에 사용해야 할 때 필수적입니다.
* **반환:** 변환에 성공하면 `Optional<Int>`를 반환하고, 실패하면 **`nil`**을 반환합니다.
* **예시:**
    ```swift
    let char: Character = "5"
    let digit = char.wholeNumberValue // Optional(5)
    let failed = Character("a").wholeNumberValue // nil
    ```

<br>

### 1.3 선행 문자(Prefix) 조건적 제거

* **관련 메소드:** `String.drop(while: )`
* **용도:** 문자열의 **선행 부분**에서 특정 조건(`where` 절)을 만족하는 연속된 문자를 제거하여 나머지 `Substring`을 반환합니다.
* **사용 시점:** **선행 공백 제거**나 **선행 '0' 제거**와 같이, 문자열의 시작 부분을 조건적으로 잘라내야 할 때 `for` 루프보다 훨씬 간결하고 효율적입니다.
* **복잡도:** 최악의 경우 문자열 길이 $N$에 대해 $O(N)$입니다.
* **예시:**
    ```swift
    let s = "   007hello"
    // 선행 공백 제거 및 선행 0 제거
    let result = String(s.drop(while: { $0 == " " || $0 == "0" })) // "7hello"
    ```

<br>

### 1.4 조건을 만족하는 선행 문자열 추출

* **관련 메소드:** `String.prefix(while: )`
* **용도:** 문자열의 **시작 부분**부터 특정 조건을 만족하는 연속된 문자로 이루어진 **접두사**를 반환합니다. 조건을 만족하지 않는 문자를 만나면 즉시 중단합니다.
* **사용 시점:** 숫자 아닌 문자를 만나기 전까지의 숫자 부분만 추출할 때 유용합니다.
* **복잡도:** 최악의 경우 문자열 길이 $N$에 대해 $O(N)$입니다.
* **예시:**
    ```swift
    let s = "123a456"
    let numericPart = s.prefix(while: { $0.isNumber }) // Substring: "123"
    let result = String(numericPart) // String: "123"
    ```

<br>

### 1.5 문자열의 첫 문자 접근 및 제거

* **관련 메소드:** `String.first`, `String.dropFirst()`
* **용도:** 문자열의 첫 문자를 확인하고 제거하여 부호 처리 등에 사용합니다. `dropFirst()`는 문자열 복사 없이 Substring을 반환하여 효율적입니다.
* **예시:**
    ```swift
    let s = "+123"
    if s.first == "+" {
        let remaining = String(s.dropFirst()) // "123"
    }
    ```

<br>
<br>

## 2. 수학 및 타입 처리

### 2.1 정수 경계 상수 및 타입 변환

* **관련 상수:** `Int32.max`, `Int32.min`, `Int64.max`, `Int64.min`
* **용도:** 32비트나 64비트 정수 범위의 오버플로우/언더플로우를 체크하고 값을 클램핑할 때 필수적입니다.
* **사용 시점:** 최종 결과가 `Int32` 범위를 벗어나는지 확인할 때, 또는 산술 오버플로우 체크의 **경계값**을 설정할 때 사용합니다.
* **예시:**
    ```swift
    let INT32_MAX = Int32.max // 2147483647
    let result: Int = Int(INT32_MAX) // Int32를 Int(64비트)로 명시적 변환
    ```

<br>

### 2.2 산술적 오버플로우/언더플로우 사전 체크

* **용도:** 값을 누적하는 과정에서 `Int` 타입의 최대/최소값을 초과하는지 **미리** 판단하여, $\text{Int32.max}$ 또는 $\text{Int32.min}$으로 즉시 클램핑하고 반환합니다. **가장 효율적인 $\text{myAtoi}$ 접근 방식입니다.**
* **원리:** 다음 연산 후의 결과가 `Int32`의 최대값(`Int32.max`)을 초과할지 역산하여 미리 확인합니다.
* **예시 (Int32 기준):**
    ```swift
    let boundary = Int32.max / 10 // 214748364 (Int32.max의 10의 자리까지)
    let result: Int32 = 0 // 누적 값

    // 양수 오버플로우 체크
    if result > boundary || (result == boundary && digit > 7) {
        return Int(Int32.max) 
    }
    
    // 음수 오버플로우 체크 (result는 양수값만 누적하고 있다고 가정, limit은 8)
    if result > boundary || (result == boundary && digit > 8) {
        return Int(Int32.min) 
    }
    
    result = result * 10 + digit // 안전하게 값 누적 
    ```

<br>

### 2.3 함수 반환 값 (튜플) 분해

* **관련 문법:** 튜플 분해 (Tuple Decomposition)
* **용도:** 함수가 여러 값을 **튜플**(`(값1, 값2)`) 형태로 반환할 때, 이 값들을 한 번의 할당으로 여러 개의 변수/상수에 깔끔하게 나누어 담습니다.
* **사용 시점:** **가공된 문자열**과 **부호**를 동시에 반환받아 변수에 할당할 때 코드를 간결하게 만듭니다.
* **예시:**
    ```swift
    // (String, Int)를 반환하는 함수 호출
    let (processedString, sign) = phase2(s) 
    // processedString과 sign에 값이 각각 할당됨
    ```