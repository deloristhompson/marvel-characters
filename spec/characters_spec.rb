# frozen_string_literal: true

require 'pry'
require 'spec_helper'
RSpec.describe MarvelCharacters::Characters do
  describe 'MarvelCharacters' do
    context 'when looking for a Gem version' do
      it 'returns a response' do
        response = MarvelCharacters::Characters.all
        expect(response['code']).to eq(200)
        expect(response['data']['results'][0]['name']).to eq('3-D Man')
      end

      context 'when passing an id' do
        it 'finds a character' do
          response = MarvelCharacters::Characters.find(1_009_610)
          expect(response['code']).to eq(200)
          expect(response['data']['results'][0]['name']).to eq('Spider-Man')
        end
      end
    end
  end
end
