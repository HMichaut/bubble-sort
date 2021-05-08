# Importing the unit test library
require "test/unit/assertions"
include Test::Unit::Assertions

# [Array-of Numbers] -> [Array-of Numbers]
# Consumes an array and returns a sorted array using the bubble sort methodology
def bubble_sort(input_array)

  # Initialization of variables used for the while loop
  list_is_not_sorted = true
  iteration = 0

  # Duplication of the input array to not destroy the input array
  output_array = input_array

  # While loop with early stopping function provided by checking if the list is sorted.
  while list_is_not_sorted

    # The array processed is reduced of one at each loop because the biggest value will always bubble to the right
    output_pair = iterate_through_array(output_array.first(output_array.length - iteration))

    # Adding the values already processed at the end of the processed array
    output_array = output_pair[0] + output_array.last(iteration)

    # Checking if at least one sorting action has been done if not the while loop will be cut early 
    list_is_not_sorted = output_pair[1]

    # Adding one iteration at each loop to feed the array processing reduction function.
    iteration += 1
  end
  return output_array
end

# [Array-of Numbers] -> [pair-of [Array-of Numbers] Boolean]
# Consumes an array and returns a sorted array using the bubble sort methodology for one round
# Returns a pair with the sorted array in first position and a boolean informing if the array 
# was alrady sorted in second position
def iterate_through_array(input_array)

  # Initialization of variable used for the checking of the array sorting 
  list_is_not_sorted = false

  # Duplication of the input array to not destroy the input array
  output_array = input_array

  # Loop through a range representing the array indexes
  (0..output_array.length - 2).each do |index|

    # Comparison of the two values next to each other and application if the sorting if true
    if (output_array[index] > output_array[index + 1])
      correction_value = output_array[index]
      output_array[index] = output_array[index + 1]
      output_array[index + 1] = correction_value

      # If at least one sorting action is processed then another sorting loop needs to be applied
      list_is_not_sorted = true
    end
  end

  # Returns a pair with the sorted array in first position and a boolean informing if the array 
  # was alrady sorted in second position
  return [output_array, list_is_not_sorted]
end

assert_equal iterate_through_array([4,3,78,2,0,2]), [[3,4,2,0,2,78], true]
assert_equal bubble_sort([4,3,78,2,0,2]), [0,2,2,3,4,78]
assert_equal bubble_sort([10,9,8,7,6,5]), [5,6,7,8,9,10]
assert_equal bubble_sort([10,5,1,3,8,9]), [1,3,5,8,9,10]