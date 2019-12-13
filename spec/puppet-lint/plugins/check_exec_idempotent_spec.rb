require 'spec_helper'

describe 'exec_idempotent' do
  let(:msg) { 'exec resource should contain either unless or onlyif parameters' }

  context 'without any idempotent parameters set' do
    let(:code) { "exec{ '/bin/false':}" }

    it 'should detect a problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a error' do
      expect(problems).to contain_error(msg).on_line(1)
    end
  end

  context 'with the inclusion of the' do
    context 'onlyif parameter' do
      let(:code){ "exec{ '/bin/cat /tmp/funny_ghost_story.txt': onlyif => '/bin/false',}" }
      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
    context 'unless parameter' do
      let(:code){ "exec{ '/bin/email_me_if_you_ever_notice_this': unless => '/bin/true',}" }
      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
     context 'onlyif parameter' do
      let(:code){ "exec{ '/usr/local/bin/delete_all_computers': refreshonly => true,}" }
      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end
  end
end
