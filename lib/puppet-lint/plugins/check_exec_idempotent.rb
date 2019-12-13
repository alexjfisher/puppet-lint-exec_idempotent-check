PuppetLint.new_check(:exec_idempotent) do
  def check
    resource_indexes.each do |resource|
      if resource[:type].value == 'exec'
        attr = resource[:tokens].select { |t| (t.type == :NAME && \
                                              t.value =~ /onlyif|refreshonly/ ||
                                              t.type == :UNLESS) && \
                                              t.next_code_token.type == :FARROW }

        next if not attr.empty?
        pos_token = resource[:tokens][0]
        notify :error, {
          :message  => 'exec resource should contain either unless or onlyif parameters',
          :line     => pos_token.line,
          :column   => pos_token.column,
          :token    => pos_token,
          :resource => resource
        }
      end
    end
  end
end
