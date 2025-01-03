# frozen_string_literal = true

class ScoringMatrix
  MATRIX_PADDING = 2
  SCORING_MATCH = 1
  SCORING_MISMATCH = -1
  SCORING_INDEL = -1

  attr_reader :f_seq, :s_seq

  def initialize(f_seq, s_seq)
    @f_seq = f_seq
    @s_seq = s_seq
  end

  def generate
    populate_matrix(f_seq, :column)
    populate_matrix(s_seq, :row)
    matrix
  end

  private

  def matrix
    @matrix ||= Array.new(row_count) { Array.new(column_count, 0) }
  end

  def row_count
    s_seq.length + MATRIX_PADDING
  end

  def column_count
    f_seq.length + MATRIX_PADDING
  end

  def virtual_index(idx)
    idx + MATRIX_PADDING
  end

  def populate_matrix(seq, dir_flag)
    seq.each_char.with_index do |ch, idx|
      if dir_flag == :column
        matrix[0][virtual_index(idx)] = ch
      else
        matrix[virtual_index(idx)][0] = ch
      end
    end

    (MATRIX_PADDING...matrix.size).each do |idx|
      gap_penalty = (idx - 1) * SCORING_INDEL
      if dir_flag == :column
        matrix[1][idx] = gap_penalty
      else
        matrix[idx][1] = gap_penalty
      end
    end
  end
end
