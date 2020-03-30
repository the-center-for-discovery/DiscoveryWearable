using Plots # IMPORT FOR PLOTTING
using Statistics # IMPORT FOR `median` FUNCTION
using LaTeXStrings # IMPORT TO ENABLE LaTeX FORMATTING
gr()

let

    # CHOOSE WINDOW AND INPUT VALUES OVER WHICH TO CALCULATE
    input = 0:0.001:1
    window = 30
    sampling_rate = 15

    # GENERATE GENERIC SIGNAL - IN THIS CASE sin(2Π)
    signal = [sin(2 * pi * i) for i in input]

    # ADDING RANDOM NOISE TO FUNCTION
    noisy_signal = [sin(2 * pi * i) + rand([-1, 1]) * round(rand(), digits = 2)
                    for i in input]

    # FILTER THE SIGNAL USING A MEDIAN FILTER & DOWNFILTERING USING A MEDIAN FILTER
    downsampled_signal::Array{Float32} = [noisy_signal[1]]
    downsampled_input::Array{Float16} = [0]
    median_signal::Array{Float32} = []
    for i in 1:length(signal)
        if length(noisy_signal) - (window + i - 1) < 0
            forward = noisy_signal[i:end]
            wrap = noisy_signal[1:abs(length(noisy_signal) - (window + i - 1))]
            append!(median_signal, median(vcat(forward, wrap)))

            # SETTING SAMPLING RATE AND CREATING DOWNSAMPLED OUTPUT
            if i % sampling_rate == 0
                append!(downsampled_input, input[i])
                append!(downsampled_signal, median(vcat(forward, wrap)))
            end
        else
            forward = noisy_signal[i:(window + i - 1)]
            append!(median_signal, median(forward))

            # SETTING SAMPLING RATE AND CREATING DOWNSAMPLED OUTPUT
            if i % sampling_rate == 0
                append!(downsampled_input, input[i])
                append!(downsampled_signal, median(forward))
            end
        end
    end

    # PLOT SIGNALS
    append!(downsampled_input, input[end])
    append!(downsampled_signal, noisy_signal[end])
    plot(input, noisy_signal, label = "Noisy Signal", title = "Example of Median Filter")
    plot!(input, median_signal, label = "Median Filtered Signal", linewidth = 3)
    plot!(input, signal, label = L"2\pi", linewidth = 5)
    plot!(downsampled_input, downsampled_signal, linewidth = 3, color = :black,
          label = "Downsampled Median Signal")

end
