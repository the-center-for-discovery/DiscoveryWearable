using Plots # IMPORT FOR PLOTTING
using Statistics # IMPORT FOR `median` FUNCTION
using LaTeXStrings # IMPORT TO ENABLE LaTeX FORMATTING
gr()

let

    # Choose Smoothing Factor, α, And Input Values Over Which To Calculate
    # Choose α: 0 < α < 1
    input = 0:0.001:1
    α = 0.05

    # Generate Generic Signal - In This Case Sin(2π)
    signal = [sin(2 * pi * i) for i in input]

    # Adding Random Noise To Function
    noisy_signal =
        [sin(2 * pi * i) + rand([-1, 1]) * round(rand(), digits = 2) for i in input]

    # Filter The Signal Using An Exponential Smoothing Filter
    exponential_signal::Array{Float32} = [noisy_signal[1]]
    for i in 2:length(signal)
        smooth_term = α * noisy_signal[i] + (1 - α) * exponential_signal[i-1]
        append!(exponential_signal, smooth_term)
    end


    # Plot Signals
    plot(
        input,
        noisy_signal,
        label = "Noisy Signal",
        title = "Example of Exponential Smoothing",
    )
    plot!(
        input,
        exponential_signal,
        label = "Exponentially Smoothed Signal",
        linewidth = 3
    )
    plot!(
        input,
        signal,
        label = L"sin(2\pi)",
        linewidth = 5
    )

end
