require "byebug"

def matrix_addition_reloaded (*matrices)
    #debugger
    return nil if matrices.any?{|m| m.length != matrices[0].length || m[0].length != matrices[0][0].length}

    matrices.reduce(Array.new(matrices[0].length){Array.new(matrices[0][0].length,0)}){|sum_m,m|matrix_addition(sum_m,m)}
end

def matrix_addition (m1, m2)
    m1.each_index.map do |i|
        m1[i].each_index.map do |j|
            m1[i][j] + m2[i][j]
        end
    end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)
    i = 0
    j = 0
    while i < matrix.length
        return true if matrix[i].all?{|el| el == matrix[i][0]}
        i+=1
    end
    while j < matrix[0].length
        return true if matrix.all?{|arr| arr[j]==matrix[0][j]}
        j+=1
    end

    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal? (matrix)
    diagonal1 = true
    diagonal2 = true

    (0...matrix.length).each do |i|
        diagonal1 = diagonal1 && matrix[i][i] == matrix[0][0]
        diagonal2 = diagonal2 &&matrix[i][-(i+1)] == matrix[0][-1]
    end

    diagonal1 || diagonal2
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle (n)
    return [] if n == 0
    return [[1]] if n == 1

    triangle = [[1]]

    #debugger
    (1...n).each do |i|
        level = [1]
        (1..i).each do |j|
            topleft = triangle[i-1][j-1]
            topright = triangle[i-1][j]

            topright = 0 if topright.nil?

            level << topleft + topright
        end
        triangle << level
    end
    triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]