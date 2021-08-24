require 'uri'
require 'net/http'
require 'json'

class DeepHealthController < ApplicationController
  def check
    @dependency_checks = [
      {
        name: "backend",
        uri: "https://#{Rails.configuration.backend['host']}:#{Rails.configuration.backend['port']}/deep-health"
      }
    ]
    @overall_health = true
    @dependency_checks.each do |dep_check|
      Net::HTTP.get_response(check[:uri])
      dep_check[:response] = Net::HTTP.get_response(dep_check[:uri])
      @overall_health = false unless res.is_a?(Net::HTTPSuccess)
    end
    render_checks(@overall_health, @dependency_checks)
  end

  def check_test_success
    render_checks(true, [
      {
        name: "backend", "uri": "https://test:443/", "response": Net::HTTPResponse::CODE_TO_OBJ['200']
      }
    ])
  end

  def check_test_fail
    render_checks(false, [
      {
        name: "backend", uri: "https://test:443/", response: Net::HTTPResponse::CODE_TO_OBJ['500']
      }
    ])
  end

  def render_checks(overall_health, dependency_checks)
    @overall_health = overall_health
    @dependency_checks = dependency_checks
    render 'check'
  end

end
