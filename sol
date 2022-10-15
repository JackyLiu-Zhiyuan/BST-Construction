BST construction

class BST:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

    def insert(self, value):
        current = self
        while True:
            if value >= current.value:
                if current.right is None:
                    current.right = BST(value)
                    break
                else:
                    current = current.right
            else:
                if current.left is None:
                    current.left = BST(value)
                    break
                else:
                    current = current.left


    def contains(self, value):
        current = self
        while True:
            if value == current.value:
                return True
            if value > current.value:
                if current.right is None:
                    return False
                else:
                    current = current.right
            elif value < current.value:
                if current.left is None:
                    return False
                else:
                    current = current.left

    def remove(self, value):
        current = self
        ancestor = current
        while True:
            if value == current.value:
                break
            elif value > current.value:
                ancestor = current
                current = current.right
            else:
                ancestor = current
                current = current.left

        # print(ancestor.value)
        # print(current.value)

        if current.left is None and current.right is None:
            if ancestor == current:
                ancestor = None
            if ancestor.left == current:
                ancestor.left = None
            elif ancestor.right == current:
                ancestor.right = None
        elif current.left is None:
            swap = current.get_min(current.right)
            if ancestor == current:
                ancestor = None
            if ancestor.left == current:
                ancestor.left.value = swap.value
            elif ancestor.right == current:
                ancestor.right.value = swap.value
        elif current.right is None:
            swap = current.get_min(current.left)
            if ancestor == current:
                ancestor = None
            if ancestor.left == current:
                ancestor.left.value = swap.value
            elif ancestor.right == current:
                ancestor.right.value = swap.value
        else:
            swap = current.get_min(current.right)
            if ancestor == current:
                ancestor.value = swap.value
            if ancestor.left == current:
                ancestor.left.value = swap.value
            elif ancestor.right == current:
                ancestor.right.value = swap.value

    def get_min(self, current):
        ancestor = current
        while current.left is not None:
            ancestor = current
            current = current.left
        ancestor.left = None
        return current




# a = BST(10)
# a.insert(5)
# a.insert(15)
# a.insert(2)
# a.insert(13)
# a.insert(22)
# a.insert(1)
# a.insert(14)
# a.insert(12)
# a.remove(10)
# a.contains(15)

a = BST(10)
a.insert(5)
a.insert(15)
a.remove(10)
a.remove(15)
a.remove(5)

print(a.value)
# print(a.contains(5))
# b = BST(5)
# c = BST(15)
# d = BST(2)
# e = BST(5)
# f = BST(13)
# g = BST(22)
# h = BST(1)
# i = BST(14)
# a.left = b
# a.right = c
# b.left = d
# b.right = e
# d.left = h
# c.left = f
# c.right = g
# f.right = i

