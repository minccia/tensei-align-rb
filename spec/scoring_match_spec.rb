# frozen_string_literal = true

require 'scoring_matrix'

RSpec.describe ScoringMatrix do 
  subject { ScoringMatrix.new(first_sequence, second_sequence).generate }

  describe '.generate' do
    context 'When the two sequences have the same length' do 
      let(:first_sequence)  { 'ACGTGC' }  
      let(:second_sequence) { 'AGCTTC' }

      it 'generates a valid matrix' do 
        expect(subject).to eq [
          [  0,    0,   'A',   'C',   'G',   'T',   'G',   'C'],
          [  0,    0,   -1,    -2,    -3,    -4,    -5,    -6 ],
          [ 'A',  -1,    1,     0,    -1,    -2,    -3,    -4 ],
          [ 'G',  -2,    0,     0,     1,     0,     1,     0 ],
          [ 'C',  -3,   -1,     1,     0,     0,     0,     2 ],
          [ 'T',  -4,   -2,     0,     0,     1,     0,     1 ],
          [ 'T',  -5,   -3,    -1,    -1,     2,     1,     0 ],
          [ 'C',  -6,   -4,     0,    -1,     1,     1,     2 ]
        ]
      end
    end
  end
end