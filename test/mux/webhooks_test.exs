defmodule Mux.WebhooksTest do
  use ExUnit.Case

  @scheme "v1"
  @payload "{\"test\":\"body\"}"
  @secret "SuperSecret123"
  @valid_signature_at_the_time "t=1565125718,v1=854ece4c22acef7c66b57d4e504153bc512595e8e9c772ece2a68150548c19a7"

  defp generate_signature(timestamp, payload, secret) do
    signature = :crypto.hmac(:sha256, secret, "#{timestamp}.#{payload}")
    |> Base.encode16(case: :lower)
    "t=#{timestamp},#{@scheme}=#{signature}"
  end

  describe "verify_header/3" do
    test "returns :error with the correct message if the signature is valid but outside the timeframe" do
      assert {:error, message} = Mux.Webhooks.verify_header(@payload, @valid_signature_at_the_time, @secret)
      assert message === "Timestamp outside the tolerance zone"
    end

    test "returns :error with the correct message if the signature is invalid" do
      assert {:error, message} = Mux.Webhooks.verify_header(@payload, "invalid-signature", @secret)
      assert message === "Unable to extract timestamp and signatures from header"
    end

    test "returns :error with the correct message if the payload doesn't have a matching signature" do
      payload = "{\"test\": \"some other body\"}"
      signature = generate_signature(System.system_time(:second), payload, @secret)
      assert {:error, message} = Mux.Webhooks.verify_header(@payload, signature, @secret)
      assert message === "No signatures found matching the expected signature for payload"
    end

    test "returns :ok if the signature is valid" do
      signature = generate_signature(System.system_time(:second), @payload, @secret)
      assert :ok = Mux.Webhooks.verify_header(@payload, signature, @secret)
    end
  end
end
