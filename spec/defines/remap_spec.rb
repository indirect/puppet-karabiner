require 'spec_helper'

describe 'karabiner::remap' do
  let(:title) { 'foobar' }

  context 'with defaults' do
    it do
      should contain_karabiner__exec('karabiner::remap::enable foobar').with({
        :command => 'enable remap.foobar',
        :unless  => 'remap.foobar=1'
      })
    end
  end

  context 'with identifier set to xyz' do
    let(:params) do
      {
        :identifier => 'xyz'
      }
    end
    it do
      should contain_karabiner__exec('karabiner::remap::enable xyz').with({
        :command => 'enable remap.xyz',
        :unless  => 'remap.xyz=1'
      })
    end
  end

  context "with ensure set to present" do
    let(:params) do
      {
        :ensure => 'present'
      }
    end

    it do
      should contain_karabiner__exec('karabiner::remap::enable foobar').with({
        :command => 'enable remap.foobar',
        :unless  => 'remap.foobar=1'
      })
    end
  end

  context "with identifier set to barfoo and ensure set to absent" do
    let(:params) do
      {
        :identifier => 'barfoo',
        :ensure     => 'absent'
      }
    end

    it do
      should contain_karabiner__exec('karabiner::remap::disable barfoo').with({
        :command => 'disable remap.barfoo',
        :onlyif => 'remap.barfoo=1'
      })
    end
  end
end
