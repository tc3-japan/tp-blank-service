# frozen_string_literal: true

class Service
  include Base

  def initialize(config)
    super(config)
  end

  def create
    create_cluster
  end

  def create_cluster
    raise "You already have the ECS cluster: #{state.config.deploy.aws.ecs.cluster.name}." unless ecs_cluster.nil?
    raise 'Unsupported operation error'
  end

  def deploy
    raise "You don\'t have the ECS service: #{state.config.deploy.aws.ecs.cluster.service.name}." if ecs_service.nil?

    puts 'Deploying...'
    state.ecs.update_service(
      cluster: ecs_service.cluster_arn,
      service: ecs_service.service_name,
      force_new_deployment: true,
    )
    puts 'Deployed'
  end
end
