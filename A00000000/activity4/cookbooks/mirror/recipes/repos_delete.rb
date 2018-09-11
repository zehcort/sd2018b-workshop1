bash 'yum_update' do
  code <<-EOH
    rm -f /etc/yum.repos.d/
  EOH
end
