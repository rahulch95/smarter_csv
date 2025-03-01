# frozen_string_literal: true

require 'spec_helper'

fixture_path = 'spec/fixtures'

describe 'be_able_to' do
  it 'strip_whitespace_from_headers' do
    options = {strip_chars_from_headers: ' '}
    data = SmarterCSV.process("#{fixture_path}/basic.csv", options)
    expect(data.size).to eq 5

    data.each do |hash|
      hash.each_key do |key|
        expect(key.class).to eq Symbol # all the keys should be symbols

        expect(%i[firstname lastname dogs cats birds fish]).to include(key)
      end

      expect(hash.size).to be <= 6
    end
  end
end
