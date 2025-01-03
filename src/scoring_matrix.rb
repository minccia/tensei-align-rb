class ScoringMatrix
  INITIALIZATION_OFFSET = 1
  SCORING_MATCH = 1 
  SCORING_MISMATCH = -1 
  SCORING_INDEL = -1 

  attr_reader :f_seq, s_seq

  def initialize(f_seq, s_seq)
    @f_seq = f_seq
    @s_seq = s_seq
  end

  def self.generate
    base = Array.new(row_count) { Array.new(column_count, nil) }

    f_seq.each_char.with_index do |ch, i| 
      virtual_index = i + 2

      base[0][virtual_index] = ch
    end

    s_seq.each_char.with_index do |ch, i| 
      virtual_index = i + 2

      base[virtual_index][0] = ch
    end
  end

  def column_count
    f_seq.length + INITIALIZATION_OFFSET
  end

  def row_count
    s_seq.length + INITIALIZATION_OFFSET
  end

  private

  def generate

  end
end