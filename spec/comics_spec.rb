# frozen_string_literal: true

require 'pry'
require 'spec_helper'
RSpec.describe MarvelCharacters::Comics do
  describe 'Comics' do
    context 'when looking for a Gem version' do
      it 'returns a response' do
        response = described_class.all
        expect(response['code']).to eq(200)
        expect(response['data']['results'][0]).to have_key('id')
      end

      it 'accepts params' do
        response = described_class.where(title: 'spider-man')
        expect(response['code']).to eq(200)
        expect(response['data']['results'][0]['title']).to include('Spider-Man')
      end

      context 'when passing an id' do
        it 'finds a comic' do
          response = described_class.find(78_358)
          expect(response['code']).to eq(200)
          expect(response['data']['results'][0]['title']).to eq('Spider-Man: Marvels Snapshots (2020) #1')
        end
      end
    end
  end
end
