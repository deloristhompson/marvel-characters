# frozen_string_literal: true

require 'pry'
require 'spec_helper'

RSpec.shared_examples 'tester' do |pirate|
  before do
    described_class.configure do |config|
      config.public_key = pirate[:marvel_public_key]
      config.private_key = pirate[:marvel_private_key]
    end
  end

  it 'can accept a public key' do
    expect(described_class.configuration.public_key).to eq pirate[:marvel_public_key]
  end

  it 'can accept a private key' do
    expect(described_class.configuration.private_key).to eq pirate[:marvel_private_key]
  end
end

RSpec.describe MarvelCharacters do
  describe 'MarvelCharacters' do
    pirate = {
      marvel_public_key: 'cf94c2809a72c81a1f404fc182994e3b',
      marvel_private_key: '9f52540e790e612ee960dc1be5062072919c515d'
    }

    it 'has a version number' do
      expect(MarvelCharacters::VERSION).not_to be nil
    end

    context 'when cnfiguring the gem with a block' do
      it_behaves_like 'tester', pirate
    end

    it 'can configure the gem with a setter' do
      described_class.configuration.public_key = 'NEW_API_KEY'

      expect(described_class.configuration.public_key).to eq 'NEW_API_KEY'
    end

    it 'raises if accessed key missing in config' do
      pirate = {
        marvel_public_key: 'MY_API_KEY',
        marvel_private_key: nil
      }

      described_class.configure do |config|
        config.public_key = pirate[:marvel_public_key]
        config.private_key = pirate[:marvel_private_key]
      end

      expect(described_class.configuration.public_key).to eq pirate[:marvel_public_key]
      expect { described_class.configuration.private_key }.to raise_error(RuntimeError)
    end
  end
end
