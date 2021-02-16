# frozen_string_literal: true

require 'pry'
require 'spec_helper'
RSpec.describe MarvelCharacters do
  describe 'MarvelCharacters' do
    context 'when looking for a Gem version' do
      it 'has a version number' do
        expect(MarvelCharacters::VERSION).not_to be nil
      end

      it 'has version 0.0.1' do
        expect(MarvelCharacters::VERSION).to eq('0.0.1')
      end
    end
  end
end
