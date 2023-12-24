class CompanySerializer < BaseSerializer
  attributes :id, :name, :owner, :logo, :website, :phone,
             :main_office, :created_at, :updated_at,
             :total_reviews, :avg_score, :company_size, :company_type,
             :created_at_timestamp, :updated_at_timestamp, :is_active, :logo,
             :avg_score, :is_good_company, :is_deleted
end