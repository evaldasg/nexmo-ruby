require_relative './test'

class NexmoConversationsTest < Nexmo::Test
  def conversation
    Nexmo::Conversations.new(client)
  end

  def conversations_uri
    'https://api.nexmo.com/beta/conversations'
  end

  def conversation_uri
    'https://api.nexmo.com/beta/conversations/' + conversation_id
  end

  def conversation_id
    'xxxx'
  end

  def headers
    {'Authorization' => bearer_token, 'Content-Type' => 'application/json'}
  end

  def test_create_method
    params = {
      name: 'test_conversation',
      display_name: 'display_test_name'
    }

    request = stub_request(:post, conversations_uri).with(headers: headers, body: params).to_return(response)

    assert_equal response_object, conversation.create(params)
    assert_requested request
  end

  def test_list_method
    headers = {'Authorization' => bearer_token}

    params = {status: 'completed'}

    request = stub_request(:get, conversations_uri).with(headers: headers, query: params).to_return(response)

    assert_equal response_object, conversation.list(params)
    assert_requested request
  end

  def test_get_method
    headers = {'Authorization' => bearer_token}

    request = stub_request(:get, conversation_uri).with(headers: headers).to_return(response)

    assert_equal response_object, conversation.get(conversation_id)
    assert_requested request
  end

  def test_update_method
    params = {
      name: 'test_conversation',
      display_name: 'display_test_name'
    }

    request = stub_request(:put, conversation_uri).with(headers: headers, body: params).to_return(response)

    assert_equal response_object, conversation.update(conversation_id, params)
    assert_requested request
  end

  def test_delete_method
    header = {'Authorization' => bearer_token}
    request = stub_request(:delete, conversation_uri).with(headers: header).to_return(status: 204)

    assert_equal :no_content, conversation.delete(conversation_id)
    assert_requested request
  end
end

