class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private let root = TrieNode()

    init() {}
    
    func insert(_ word: String) {
        var node = root
        
        for char in word {
            // 1. 해당 node에 char에 대응하는 key가 없는 경우
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        // for문이 종료된 이후에는 최 하단의 노드에 위치함
        // 따라서 isEndOfWord를 갱신
        node.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var node = root

        // 글자를 순서대로 따라감
        for char in word {
            // 현재 node의 children에 char가 있는지 확인
            guard let nextNode = node.children[char] else {
                return false
            }
            node = nextNode
        }

        return node.isEndOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var node = root

        for char in prefix {
            guard let nextNode = node.children[char] else { return false }
            node = nextNode
        }

        // endOfWord 가 아니여도, prefix가 끝날 때 까지 탐색중이라면 해당 prefix를 갖는 단어가 있음을 나타냄
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */