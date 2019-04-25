require 'spec_helper'
describe 'environment_local_facts' do
  context 'with default values for all parameters' do
    it { should contain_class('environment_local_facts') }
  end
end
