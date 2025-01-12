class WorkMailer < ActionMailer::Base
  default from: "info@engist.jp"
  def received_email(work)
    @work = work
    mail to: "info@engist.jp"
    mail(subject: 'ENGISTにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(work)
    @work = work
    mail to: work.email
    mail(subject: 'ENGISTにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_work_info(work, contract)
    @work = work
    @contract = contract
    mail(to: @contract.email, cc: @contract.cc, subject: '人材紹介のご案内')
  end
end
