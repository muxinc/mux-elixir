defmodule Mux.Fixtures do
  @moduledoc false

  def asset(a \\ nil)

  def asset(:create) do
    %{
      "status" => "preparing",
      "playback_ids" => [
        %{
          "policy" => "public",
          "id" => "CypWdvOIUrxjI7RlRAbVm01fGxFMO6wfH"
        }
      ],
      "id" => "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc",
      "created_at" => "1521503163"
    }
  end

  def asset(:update) do
    asset()
    |> Map.put("passthrough", "updated_passthrough")
  end

  def asset(_) do
    %{
      "tracks" => [
        %{
          "type" => "video",
          "max_width" => 1920,
          "max_height" => 1080,
          "max_frame_rate" => 29.97,
          "id" => "7wVkNSIVRAIKB1oj6jezHK1BATAXuwy3",
          "duration" => 23.8238
        },
        %{
          "type" => "audio",
          "max_channels" => 2,
          "max_channel_layout" => "stereo",
          "id" => "PnA02RYkGox02I01NDr02yAzp5qqAiOS401VgQO1pg00gByzk",
          "duration" => 23.872
        }
      ],
      "status" => "ready",
      "playback_ids" => [
        %{
          "policy" => "public",
          "id" => "CypWdvOIUrxjI7RlRAbVm01fGxFMO6wfH"
        }
      ],
      "max_stored_resolution" => "HD",
      "max_stored_frame_rate" => 29.97,
      "mp4_support" => "none",
      "master_access" => "none",
      "id" => "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc",
      "duration" => 23.872,
      "created_at" => "1521503163",
      "aspect_ratio" => "16:9"
    }
  end

  def live_stream(:update) do
    live_stream()
    |> Map.put("passthrough", "updated_passthrough")
    |> Map.put("latency_mode", "low")
    |> Map.put("reconnect_window", 30)
    |> Map.put("max_continuous_duration", 21600)
  end

  def live_stream(:subtitles) do
    live_stream()
    |> Map.put("embedded_subtitles", %{
      "name" => "English CC",
      "language_code" => "en",
      "language_channel" => "cc1",
      "passthrough" => "Example"
    })
  end

  def live_stream() do
    %{
      "stream_key" => "54676b58-6b19-5acb-f5bf-3aa35222efc6",
      "status" => "idle",
      "reconnect_window" => 60,
      "playback_ids" => [
        %{
          "policy" => "public",
          "id" => "iOkfIGstt4u1eYdFcPKGTWKz75Acpv3w"
        }
      ],
      "new_asset_settings" => %{
        "playback_policies" => ["public"]
      },
      "id" => "aA02skpHXoLrbQm49qIzAG6RtewFOcDEY",
      "created_at" => "1557338261"
    }
  end

  def playback_id_full do
    %{
      "policy" => "public",
      "object" => %{
        "type" => "live_stream",
        "id" => "ZXs9U1Wqr3C4GBVCOYRQOA00lLtijnVhehJIb8tlDzL00"
      },
      "id" => "7IxC7stYLro5Z4nEs97J02OkLEKFME6mvhnuRJybhRKU"
    }
  end

  def input_info() do
    %{
      "file" => %{
        "container_format" => "mov,mp4,m4a,3gp,3g2,mj2",
        "tracks" => [
          %{
            "duration" => 23.8238,
            "encoding" => "h264",
            "frame_rate" => 29.97,
            "height" => 1080,
            "type" => "video",
            "width" => 1920
          },
          %{
            "channels" => 2,
            "duration" => 23.872,
            "encoding" => "aac",
            "sample_rate" => 48000,
            "type" => "audio"
          }
        ]
      },
      "settings" => %{
        "url" => "https://storage.googleapis.com/muxdemofiles/mux-video-intro.mp4"
      }
    }
  end

  def playback_id do
    %{
      "policy" => "public",
      "id" => "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"
    }
  end

  def track do
    %{
      "type" => "text",
      "text_type" => "subtitles",
      "status" => "preparing",
      "passthrough" => "English",
      "name" => "English",
      "language_code" => "en",
      "id" => "2"
    }
  end

  def simulcast_target do
    %{
      "id" => "vuOfW021mz5QA500wYEQ9SeUYvuYnpFz011mqSvski5T8claN02JN9ve2g",
      "url" => "rtmp://live.example1.com/app",
      "stream_key" => "abcdefgh",
      "passthrough" => "Example 1"
    }
  end

  def delivery_usage do
    %{
      "passthrough" => "Example 1",
      "delivered_seconds" => 2040.533333,
      "created_at" => "1566324794",
      "asset_state" => "ready",
      "asset_id" => "XwYTXo41yZD2xDIOKp2p00",
      "asset_duration" => 480.533333
    }
  end

  def playback_restriction do
    %{
      "updated_at" => "1653174155",
      "referrer" => %{
        "allowed_domains" => [
          "*.example.com"
        ],
        "allow_no_referrer" => true
      },
      "id" => "uP6cf00TE5HUvfdEmI6PR01vXQgZEjydC3",
      "created_at" => "1653174155"
    }
  end

  def space do
    %{
      "broadcasts" => [
        broadcast()
      ],
      "created_at" => "1653342466",
      "id" => "xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk",
      "passthrough" => "example",
      "status" => "idle",
      "type" => "server"
    }
  end

  def broadcast do
    %{
      "background" => "https://example.com/background.jpg",
      "id" => "fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ",
      "layout" => "gallery",
      "live_stream_id" => "vJvFbCojkuSDAAeEK4EddOA01wRqN1mP4",
      "resolution" => "1920x1080",
      "status" => "idle"
    }
  end

  def breakdown do
    %{
      "total_row_count" => 2,
      "timeframe" => [
        1_516_241_988,
        1_516_501_188
      ],
      "data" => [
        %{
          "views" => 3,
          "value" => 3500,
          "total_watch_time" => 7500,
          "negative_impact" => 1,
          "field" => "mac"
        },
        %{
          "views" => 2,
          "value" => 1000,
          "total_watch_time" => 3500,
          "negative_impact" => 2,
          "field" => "windows"
        }
      ]
    }
  end

  def comparison do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_516_241_921,
        1_516_501_121
      ],
      "data" => [
        %{
          "watch_time" => 32000,
          "view_count" => 2,
          "name" => "totals"
        },
        %{
          "value" => 0.25,
          "type" => "score",
          "name" => "Overall Score",
          "metric" => "viewer_experience_score"
        },
        %{
          "value" => 1,
          "type" => "score",
          "name" => "Playback Failure Score",
          "metric" => "playback_failure_score",
          "items" => [
            %{
              "value" => 0,
              "type" => "percentage",
              "name" => "Playback Failure Percentage",
              "metric" => "playback_failure_percentage"
            }
          ]
        },
        %{
          "value" => 1,
          "type" => "score",
          "name" => "Startup Time Score",
          "metric" => "startup_time_score",
          "items" => [
            %{
              "value" => 1000,
              "type" => "milliseconds",
              "name" => "Video Startup Time (median)",
              "metric" => "video_startup_time",
              "measurement" => "median"
            },
            %{
              "value" => 1000,
              "type" => "milliseconds",
              "name" => "Video Startup Time (95th %)",
              "metric" => "video_startup_time",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Player Startup Time (median)",
              "metric" => "player_startup_time",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Player Startup Time (95th %)",
              "metric" => "player_startup_time",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Page Load Time (median)",
              "metric" => "page_load_time",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Page Load Time (95th %)",
              "metric" => "page_load_time",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Aggregate Startup Time (median)",
              "metric" => "aggregate_startup_time",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Aggregate Startup Time (95th %)",
              "metric" => "aggregate_startup_time",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "milliseconds",
              "name" => "Seek Latency",
              "metric" => "seek_latency"
            },
            %{
              "value" => 0,
              "type" => "percentage",
              "name" => "Exits Before Video Start",
              "metric" => "exits_before_video_start"
            }
          ]
        },
        %{
          "value" => 0.25,
          "type" => "score",
          "name" => "Rebuffer Score",
          "metric" => "rebuffer_score",
          "items" => [
            %{
              "value" => 0,
              "type" => "percentage",
              "name" => "Rebuffer Percentage",
              "metric" => "rebuffer_percentage"
            },
            %{
              "value" => 13.125,
              "type" => "per_minute",
              "name" => "Rebuffer Frequency",
              "metric" => "rebuffer_frequency"
            },
            %{
              "value" => 0,
              "type" => "milliseconds",
              "name" => "Rebuffer Duration (median)",
              "metric" => "rebuffer_duration",
              "measurement" => "median"
            },
            %{
              "value" => 0,
              "type" => "milliseconds",
              "name" => "Rebuffer Duration (95th %)",
              "metric" => "rebuffer_duration",
              "measurement" => "95th"
            },
            %{
              "value" => 2,
              "type" => "number",
              "name" => "Rebuffer Count (median)",
              "metric" => "rebuffer_count",
              "measurement" => "median"
            },
            %{
              "value" => 5,
              "type" => "number",
              "name" => "Rebuffer Count (95th %)",
              "metric" => "rebuffer_count",
              "measurement" => "95th"
            }
          ]
        },
        %{
          "value" => nil,
          "type" => "score",
          "name" => "Video Quality Score",
          "metric" => "video_quality_score",
          "items" => [
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Upscale Percentage (median)",
              "metric" => "upscale_percentage",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Upscale Percentage (95th %)",
              "metric" => "upscale_percentage",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Upscale Percentage (average)",
              "metric" => "upscale_percentage",
              "measurement" => "avg"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Downscale Percentage (median)",
              "metric" => "downscale_percentage",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Downscale Percentage (95th %)",
              "metric" => "downscale_percentage",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Downscale Percentage (average)",
              "metric" => "downscale_percentage",
              "measurement" => "avg"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Max Upscale Percentage (median)",
              "metric" => "max_upscale_percentage",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Max Upscale Percentage (95th %)",
              "metric" => "max_upscale_percentage",
              "measurement" => "95th"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Max Downscale Percentage (median)",
              "metric" => "max_downscale_percentage",
              "measurement" => "median"
            },
            %{
              "value" => nil,
              "type" => "percentage",
              "name" => "Max Downscale Percentage (95th %)",
              "metric" => "max_downscale_percentage",
              "measurement" => "95th"
            }
          ]
        }
      ]
    }
  end

  def exports() do
    %{
      "total_row_count" => 2,
      "timeframe" => [
        1_516_328_401,
        1_516_414_801
      ],
      "data" => [
        "https://s3.amazonaws.com/mux-data-exports-test/10942/2017_10_1.csv.gz?signature=asdf1234",
        "https://s3.amazonaws.com/mux-data-exports-test/10942/2017_10_2.csv.gz?signature=asdf1234"
      ]
    }
  end

  def view_exports() do
    %{
      "total_row_count" => 7,
      "timeframe" => [
        1_626_296_941,
        1_626_383_341
      ],
      "data" => [
        %{
          "files" => [
            %{
              "version" => 2,
              "type" => "csv",
              "path" =>
                "https://s3.amazonaws.com/mux-data-exports/1/2021_01_03.csv.gz?...signature..."
            }
          ],
          "export_date" => "2021-01-03"
        },
        %{
          "files" => [
            %{
              "version" => 2,
              "type" => "csv",
              "path" =>
                "https://s3.amazonaws.com/mux-data-exports/1/2021_01_02.csv.gz?...signature..."
            }
          ],
          "export_date" => "2021-01-02"
        },
        %{
          "files" => [
            %{
              "version" => 2,
              "type" => "csv",
              "path" =>
                "https://s3.amazonaws.com/mux-data-exports/1/2021_01_01.csv.gz?...signature..."
            }
          ],
          "export_date" => "2021-01-01"
        }
      ]
    }
  end

  def filters() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_516_328_397,
        1_516_414_797
      ],
      "data" => %{
        "basic" => [
          "browser",
          "country",
          "operating_system",
          "player_software",
          "player_software_version",
          "source_hostname",
          "source_type",
          "stream_type",
          "video_title"
        ],
        "advanced" => [
          "asn",
          "browser_version",
          "cdn",
          "experiment_name",
          "operating_system_version",
          "player_name",
          "player_version",
          "preroll_ad_asset_hostname",
          "preroll_ad_tag_hostname",
          "preroll_played",
          "preroll_requested",
          "sub_property_id",
          "video_series"
        ]
      }
    }
  end

  def filters(:browser) do
    %{
      "total_row_count" => 2,
      "timeframe" => [
        1_516_241_996,
        1_516_501_196
      ],
      "data" => [
        %{
          "value" => "Safari",
          "total_count" => 2
        },
        %{
          "value" => "Chrome",
          "total_count" => 1
        }
      ]
    }
  end

  def incidents() do
    %{
      "total_row_count" => 1,
      "timeframe" => [
        1_563_237_968,
        1_563_324_368
      ],
      "data" => [
        %{
          "threshold" => 50,
          "status" => "open",
          "started_at" => "2019-07-17T00:46:08.344Z",
          "severity" => "alert",
          "sample_size_unit" => "views",
          "sample_size" => 100,
          "resolved_at" => nil,
          "notifications" => [],
          "notification_rules" => [],
          "measurement" => "error_rate",
          "measured_value_on_close" => nil,
          "measured_value" => 55.7,
          "incident_key" => "country=US",
          "impact" => "*30 views* have been affected so far at a rate of *60 per hour*",
          "id" => "pid1083",
          "error_description" => "This is a message for this crazy error",
          "description" =>
            "Overall error-rate is significantly high (55.7%) due to an error of *This is a message for this crazy error*",
          "breakdowns" => [
            %{
              "value" => "957",
              "name" => "error_type_id",
              "id" => "pid1077"
            }
          ],
          "affected_views_per_hour_on_open" => 30,
          "affected_views_per_hour" => 60,
          "affected_views" => 30
        }
      ]
    }
  end

  def incident() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_563_237_972,
        1_563_324_372
      ],
      "data" => %{
        "threshold" => 50,
        "status" => "open",
        "started_at" => "2019-07-16T23:46:12.047Z",
        "severity" => "alert",
        "sample_size_unit" => "views",
        "sample_size" => 100,
        "resolved_at" => nil,
        "notifications" => [],
        "notification_rules" => [],
        "measurement" => "error_rate",
        "measured_value_on_close" => nil,
        "measured_value" => 55.7,
        "incident_key" => "country=US",
        "impact" => nil,
        "id" => "ABCD1234",
        "error_description" => "This is a message for this crazy error",
        "description" =>
          "Overall error-rate is significantly high (55.7%) due to an error of *This is a message for this crazy error*",
        "breakdowns" => [
          %{
            "value" => "989",
            "name" => "error_type_id",
            "id" => "pid1949"
          }
        ],
        "affected_views_per_hour_on_open" => nil,
        "affected_views_per_hour" => nil,
        "affected_views" => nil
      }
    }
  end

  def related_incidents() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_563_237_971,
        1_563_324_371
      ],
      "data" => [
        %{
          "threshold" => 50,
          "status" => "open",
          "started_at" => "2019-07-16T23:46:11.183Z",
          "severity" => "alert",
          "sample_size_unit" => "views",
          "sample_size" => 100,
          "resolved_at" => nil,
          "notifications" => [],
          "notification_rules" => [],
          "measurement" => "error_rate",
          "measured_value_on_close" => nil,
          "measured_value" => 55.7,
          "incident_key" => "country=US",
          "impact" => "*30 views* have been affected so far at a rate of *25 per hour*",
          "id" => "pid1759",
          "error_description" => "This is a message for this crazy error",
          "description" =>
            "Overall error-rate is significantly high (55.7%) due to an error of *This is a message for this crazy error*",
          "breakdowns" => [
            %{
              "value" => "983",
              "name" => "error_type_id",
              "id" => "pid1753"
            }
          ],
          "affected_views_per_hour_on_open" => 30,
          "affected_views_per_hour" => 25,
          "affected_views" => 30
        }
      ]
    }
  end

  def insights() do
    %{
      "total_row_count" => 2,
      "timeframe" => [
        1_500_389_723,
        1_500_648_923
      ],
      "data" => [
        %{
          "total_watch_time" => 10000,
          "total_views" => 5,
          "total_row_count" => 1,
          "negative_impact_score" => 0.6,
          "metric" => 4000,
          "filter_value" => "US",
          "filter_column" => "country"
        }
      ]
    }
  end

  def overall() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_516_241_946,
        1_516_501_146
      ],
      "data" => %{
        "value" => 0.8333333333333334,
        "total_watch_time" => 3000,
        "total_views" => 3,
        "global_value" => nil
      }
    }
  end

  def signature(:sign) do
    "abcdewefsdllkjejosoeifjoseifjosiejlsekfjsloeifjselofijsoeifjsoeifj"
  end

  def signing_key(a \\ nil)

  def signing_key(:create) do
    %{
      "private_key" => "thisisaverysecretkeythatinreallifewouldbealotlonger==",
      "id" => "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C",
      "created_at" => "1540438441"
    }
  end

  def signing_key(_) do
    %{
      "id" => "3kXq01SS00BQZqHHIq1egKAhuf7urAc400C",
      "created_at" => "1540438441"
    }
  end

  def timeseries() do
    %{
      "total_row_count" => 73,
      "timeframe" => [
        1_516_241_947,
        1_516_501_147
      ],
      "data" => [
        [
          "2018-01-19T02:00:00.000Z",
          0,
          2
        ],
        [
          "2018-01-19T03:00:00.000Z",
          1,
          3
        ]
      ]
    }
  end

  def upload(a \\ nil)

  def upload(:create) do
    %{
      "url" =>
        "https://storage.googleapis.com/video-storage-us-east1-uploads/OOTbA00CpWh6OgwV3asF00IvD2STk22UXM?Expires=1545157644&GoogleAccessId=mux-direct-upload%40mux-cloud.iam.gserviceaccount.com&Signature=bloopblop",
      "timeout" => 3600,
      "status" => "waiting",
      "new_asset_settings" => %{
        "playback_policies" => [
          "public"
        ]
      },
      "id" => "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM",
      "cors_origin" => "http://localhost:8080"
    }
  end

  def upload(:cancel) do
    %{
      "url" =>
        "https://storage.googleapis.com/video-storage-us-east1-uploads/OOTbA00CpWh6OgwV3asF00IvD2STk22UXM?Expires=1545157644&GoogleAccessId=mux-direct-upload%40mux-cloud.iam.gserviceaccount.com&Signature=bloopblop",
      "timeout" => 3600,
      "status" => "cancelled",
      "new_asset_settings" => %{
        "playback_policies" => [
          "public"
        ]
      },
      "id" => "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM",
      "cors_origin" => "http://localhost:8080"
    }
  end

  def upload(_) do
    %{
      "url" =>
        "https://storage.googleapis.com/video-storage-us-east1-uploads/OOTbA00CpWh6OgwV3asF00IvD2STk22UXM?Expires=1545157644&GoogleAccessId=mux-direct-upload%40mux-cloud.iam.gserviceaccount.com&Signature=bloopblop",
      "timeout" => 3600,
      "status" => "waiting",
      "new_asset_settings" => %{
        "playback_policies" => [
          "public"
        ]
      },
      "id" => "OOTbA00CpWh6OgwV3asF00IvD2STk22UXM",
      "cors_origin" => "http://localhost:8080"
    }
  end

  def transcription_vocabulary() do
    %{
      "created_at" => "1657242248",
      "id" => "ANZLqMO4E01TQW01SyFJfrdZzvjMVuyYqE",
      "name" => "API Vocabulary",
      "phrases" => ["Mux", "Live Stream", "Playback ID"],
      "updated_at" => "1657242248"
    }
  end

  def transcription_vocabulary(:update) do
    %{
      "created_at" => "1657242248",
      "id" => "ANZLqMO4E01TQW01SyFJfrdZzvjMVuyYqE",
      "name" => "New API Vocabulary",
      "phrases" => ["Mux", "Live Stream", "Playback ID", "New phrase"],
      "updated_at" => "1657242420"
    }
  end

  def video_views() do
    %{
      "total_row_count" => 2,
      "timeframe" => [
        1_516_241_921,
        1_516_501_121
      ],
      "data" => [
        %{
          "viewer_os_family" => nil,
          "viewer_application_name" => "Chrome",
          "view_start" => "2018-01-19T02 =>18 =>41.940Z",
          "view_end" => "2018-01-19T02 =>18 =>41.940Z",
          "video_title" => nil,
          "total_row_count" => 2,
          "player_error_message" => nil,
          "player_error_code" => nil,
          "id" => "DEM1z65UMx6Ldcgq9tDR9tkJNTqlE5eNlN4",
          "error_type_id" => 1087,
          "country_code" => nil
        },
        %{
          "viewer_os_family" => nil,
          "viewer_application_name" => "Chrome",
          "view_start" => "2018-01-19T02 =>18 =>41.940Z",
          "view_end" => "2018-01-19T02 =>18 =>41.940Z",
          "video_title" => nil,
          "total_row_count" => 2,
          "player_error_message" => nil,
          "player_error_code" => nil,
          "id" => "k8n4aklUyrRDekILDWta1qSJqNFpYB7N50",
          "error_type_id" => 1088,
          "country_code" => nil
        }
      ]
    }
  end

  def video_view() do
    %{
      "total_row_count" => 1,
      "timeframe" => [
        1_516_241_921,
        1_516_501_121
      ],
      "data" => %{
        "view_seek_duration" => nil,
        "video_language" => nil,
        "viewer_os_family" => nil,
        "viewer_user_agent" => nil,
        "player_error_code" => nil,
        "player_height" => nil,
        "player_poster" => nil,
        "time_to_first_frame" => nil,
        "player_source_type" => nil,
        "video_stream_type" => nil,
        "cdn" => nil,
        "buffering_rate" => nil,
        "metro" => nil,
        "player_instance_id" => "123",
        "viewer_application_version" => "8",
        "updated_at" => "2018-01-20T02:19:15.000Z",
        "player_source_host_name" => nil,
        "preroll_played" => false,
        "player_source_duration" => nil,
        "view_total_downscaling" => nil,
        "player_source_stream_type" => nil,
        "continent_code" => nil,
        "view_error_id" => nil,
        "page_load_time" => nil,
        "video_variant_id" => nil,
        "view_id" => "123",
        "watch_time" => nil,
        "isp" => nil,
        "inserted_at" => "2018-01-20T02:19:15.000Z",
        "viewer_application_name" => "Safari",
        "exit_before_video_start" => false,
        "view_seek_count" => nil,
        "player_software" => nil,
        "player_preload" => false,
        "asn" => nil,
        "view_end" => "2018-01-19T02:18:41.940Z",
        "events" => [],
        "video_startup_preroll_request_time" => nil,
        "view_total_content_playback_time" => nil,
        "buffering_duration" => nil,
        "requests_for_first_preroll" => nil,
        "player_width" => nil,
        "page_url" => "http://example.com/foo/bar",
        "preroll_ad_tag_hostname" => nil,
        "session_id" => "123",
        "viewer_os_architecture" => nil,
        "page_type" => nil,
        "view_max_downscale_percentage" => nil,
        "preroll_ad_asset_hostname" => nil,
        "video_variant_name" => nil,
        "experiment_name" => nil,
        "watched" => false,
        "mux_api_version" => nil,
        "player_load_time" => nil,
        "preroll_requested" => false,
        "region" => nil,
        "player_error_message" => nil,
        "country_code" => nil,
        "player_source_domain" => nil,
        "longitude" => nil,
        "player_name" => nil,
        "video_producer" => nil,
        "video_series" => nil,
        "country_name" => nil,
        "rebuffer_percentage" => nil,
        "used_fullscreen" => false,
        "video_encoding_variant" => nil,
        "player_language" => nil,
        "viewer_device_manufacturer" => nil,
        "view_start" => "2018-01-19T02:18:41.940Z",
        "latitude" => nil,
        "viewer_device_category" => nil,
        "video_id" => nil,
        "player_source_width" => nil,
        "property_id" => 10185,
        "city" => nil,
        "player_software_version" => nil,
        "player_autoplay" => false,
        "video_duration" => nil,
        "buffering_count" => nil,
        "view_max_upscale_percentage" => nil,
        "platform_summary" => "Safari",
        "viewer_application_engine" => nil,
        "mux_embed_version" => nil,
        "error_type_id" => nil,
        "id" => "k8n4aklUyrRDekILDWta1qSJqNFpYB7N50",
        "player_version" => nil,
        "player_startup_time" => nil,
        "player_source_url" => nil,
        "view_total_upscaling" => nil,
        "short_time" => " 2:18am UTC 2018-01-19",
        "viewer_user_id" => nil,
        "player_mux_plugin_version" => nil,
        "video_title" => nil,
        "mux_viewer_id" => "123",
        "viewer_device_name" => nil,
        "viewer_os_version" => nil,
        "video_content_type" => nil,
        "player_view_count" => nil,
        "player_source_height" => nil,
        "video_startup_preroll_load_time" => nil,
        "platform_description" => nil
      }
    }
  end

  def errors() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_516_328_328,
        1_516_414_728
      ],
      "data" => [
        %{
          "percentage" => 0.6666666666666666,
          "notes" => "This is a really crazy note",
          "message" => "This is a message for this crazy error",
          "last_seen" => "2018-01-20T01:18:48.054Z",
          "id" => 1121,
          "description" =>
            "If we're going to understand this error, first we need to understand life itself.",
          "count" => 2,
          "code" => 1
        },
        %{
          "percentage" => 0.3333333333333333,
          "notes" => "This is a really crazy note",
          "message" => "This is a message for this crazy error",
          "last_seen" => "2018-01-19T23:18:48.054Z",
          "id" => 1120,
          "description" =>
            "If we're going to understand this error, first we need to understand life itself.",
          "count" => 1,
          "code" => 3
        }
      ]
    }
  end

  def realtime_dimensions() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_584_577_180,
        1_584_663_580
      ],
      "data" => [
        %{
          "name" => "asn",
          "display_name" => "ASN"
        },
        %{
          "name" => "cdn",
          "display_name" => "CDN"
        },
        %{
          "name" => "country",
          "display_name" => "Country"
        },
        %{
          "name" => "operating_system",
          "display_name" => "Operating system"
        },
        %{
          "name" => "player_name",
          "display_name" => "Player name"
        },
        %{
          "name" => "region",
          "display_name" => "Region / State"
        },
        %{
          "name" => "stream_type",
          "display_name" => "Stream type"
        },
        %{
          "name" => "sub_property_id",
          "display_name" => "Sub property ID"
        },
        %{
          "name" => "video_series",
          "display_name" => "Video series"
        },
        %{
          "name" => "video_title",
          "display_name" => "Video title"
        }
      ]
    }
  end

  def realtime_metrics() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_584_577_184,
        1_584_663_584
      ],
      "data" => [
        %{
          "name" => "current-concurrent-viewers",
          "display_name" => "Current Concurrent Viewers (CCV)"
        },
        %{
          "name" => "current-rebuffering-percentage",
          "display_name" => "Current Rebuffering Percentage"
        },
        %{
          "name" => "exits-before-video-start",
          "display_name" => "Exits Before Video Start"
        },
        %{
          "name" => "playback-failure-percentage",
          "display_name" => "Playback Failure Percentage"
        },
        %{
          "name" => "video-startup-time",
          "display_name" => "Video Startup Time"
        }
      ]
    }
  end

  def realtime_breakdown() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_547_853_000,
        1_547_853_000
      ],
      "data" => [
        %{
          "value" => "AR",
          "negative_impact" => 3,
          "metric_value" => 0,
          "concurrent_viewers" => 1
        }
      ]
    }
  end

  def realtime_histogram_timeseries() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_582_591_920,
        1_582_593_660
      ],
      "meta" => %{
        "buckets" => [
          %{
            "start" => 0,
            "end" => 100
          },
          %{
            "start" => 100,
            "end" => 500
          },
          %{
            "start" => 500,
            "end" => 1000
          },
          %{
            "start" => 1000,
            "end" => 2000
          },
          %{
            "start" => 2000,
            "end" => 5000
          },
          %{
            "start" => 5000,
            "end" => 10000
          },
          %{
            "start" => 10000,
            "end" => nil
          }
        ],
        "bucket_unit" => "milliseconds"
      },
      "data" => [
        %{
          "timestamp" => "2020-02-25T00:52:00Z",
          "sum" => 76,
          "p95" => 6809,
          "median" => 425,
          "max_percentage" => 0.27631578947368424,
          "bucket_values" => [
            %{
              "percentage" => 0.25,
              "count" => 19
            },
            %{
              "percentage" => 0.27631578947368424,
              "count" => 21
            },
            %{
              "percentage" => 0.19736842105263158,
              "count" => 15
            },
            %{
              "percentage" => 0.14473684210526316,
              "count" => 11
            },
            %{
              "percentage" => 0.05263157894736842,
              "count" => 4
            },
            %{
              "percentage" => 0.05263157894736842,
              "count" => 4
            },
            %{
              "percentage" => 0.02631578947368421,
              "count" => 2
            }
          ],
          "average" => 1446.328947368421
        }
      ]
    }
  end

  def realtime_timeseries() do
    %{
      "total_row_count" => nil,
      "timeframe" => [
        1_582_591_905,
        1_582_593_700
      ],
      "data" => [
        %{
          "value" => 0.0597809346162238,
          "date" => "2020-02-25T00:51:45Z",
          "concurrent_viewers" => 477
        },
        %{
          "value" => 0.059590005296620834,
          "date" => "2020-02-25T00:51:50Z",
          "concurrent_viewers" => 487
        }
      ]
    }
  end

  def tesla_env({fixture_name, args}) do
    %Tesla.Env{
      __client__: nil,
      __module__: nil,
      body: %{
        "data" => apply(__MODULE__, fixture_name, args)
      },
      headers: [],
      method: nil,
      opts: [],
      query: [],
      status: 201,
      url: ""
    }
  end
end
