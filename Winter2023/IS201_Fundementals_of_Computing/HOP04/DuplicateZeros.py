def duplicateZeros(arr) -> None:
    i = 0
    while i < len(arr) - 1:
        if arr[i] == 0:
            arr.pop(i)
            arr.insert(i + 1, i)
            i += 1
        i += 1
    print(arr)

# the last zero doe snot get removed
arr1 = [9, 0, 2, 3, 0, 4, 5, 0]
duplicateZeros(arr1)
