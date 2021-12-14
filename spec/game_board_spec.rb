# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/game_board'
require_relative '../lib/colors'

# spec/game_spec.rb

describe GameBoard do # rubocop:disable Metrics/BlockLength
  subject(:game_board) { described_class.new }
  describe '#exactly size game board' do
    it { expect(game_board.board.size).to eq 6 }
    it { expect(game_board.board[0].size).to eq 7 }
  end

  describe '#update_board' do # rubocop:disable Metrics/BlockLength
    context 'when drop into column not contain piece' do
      let(:update_board) { game_board.update_board(0, 1) }

      it 'update correct game board' do
        update_board
        expect(game_board.board[5][0]).to eq 1
      end
    end

    context 'when drop into column have contain piece' do
      let(:update_board) do
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
      end

      it 'update correct game board' do
        update_board
        expect(game_board.board[3][0]).to eq 1
      end
    end

    context 'when drop into column full piece' do
      let(:update_board) do
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
        game_board.update_board(0, 1)
      end

      it 'update correct game board' do
        expect(update_board).to eq 5
      end
    end
  end

  describe '#check_win' do # rubocop:disable Metrics/BlockLength
    context 'check horizontal' do
      before do
        game_board.board = [
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [1, 1, 0, 0, 2, 0, 0],
          [2, 2, 1, 1, 1, 1, 0],
          [2, 2, 1, 2, 2, 2, 1],
          [1, 1, 2, 1, 2, 1, 2]
        ]
      end

      it 'return true' do
        expect(game_board.check_win(1)).to eq true
      end
    end

    context 'check horizontal' do
      before do
        game_board.board = [
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [1, 1, 0, 0, 2, 0, 0],
          [2, 2, 1, 1, 1, 1, 0],
          [2, 2, 1, 2, 2, 2, 1],
          [1, 1, 2, 1, 2, 1, 2]
        ]
      end

      it 'return true' do
        expect(game_board.check_win(1)).to eq true
      end
    end

    context 'check vertical' do
      before do
        game_board.board = [
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 2, 0],
          [1, 1, 0, 1, 2, 2, 1],
          [2, 2, 1, 1, 1, 2, 1],
          [2, 2, 1, 2, 2, 2, 1],
          [1, 1, 2, 1, 2, 1, 2]
        ]
      end

      it 'return true' do
        expect(game_board.check_win(2)).to eq true
      end
    end

    context 'check diagonal' do
      before do
        game_board.board = [
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [1, 1, 1, 0, 2, 2, 0],
          [2, 2, 1, 1, 2, 1, 1],
          [2, 2, 1, 2, 2, 2, 1],
          [1, 1, 2, 1, 2, 1, 2]
        ]
      end

      it 'return true' do
        expect(game_board.check_win(2)).to eq true
      end
    end

    context 'check draw' do
      before do
        game_board.board = [
          [1, 1, 2, 2, 2, 1, 1],
          [2, 2, 1, 1, 1, 2, 2],
          [1, 1, 2, 1, 2, 1, 2],
          [2, 2, 2, 1, 2, 1, 1],
          [2, 2, 1, 2, 1, 2, 1],
          [1, 1, 2, 1, 2, 1, 2]
        ]
      end

      it 'return true' do
        expect(game_board.check_draw).to eq true
      end
    end
  end
end
