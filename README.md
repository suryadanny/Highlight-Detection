# Highlight-Detection #


**Introduction**

We have implement a highglight/applause detection algorithm for meeting speech. The objective is acheived via using feature such as the short-time
autocorrelation features such as autocorrelation energy decay factor, amplitude and lag values of first local minimum and zero-crossing points extracted from the autocorrelation sequence of a windowed audio signal. we have applied decision thresholds for the above acoustic features to identify applause and non-applause segments from the audio stream.

The implemented algorithm has three steps - 
* Preprocessing
* Feature extraction
* descision maling

**Refernece -** https://ieeexplore.ieee.org/abstract/document/5941827

### Preprocessing ###

* the meeting speech signal is usually corrupted by different noise sources such as microphone and power line interferences. 
* we have used Linear phase finite impulse response filters. The original speech signal is fed to the filter for suppressing microphone and power line interferences. 
* Only the segments which are detected as silent are discarded and only the other frames are processed further. Silence detection is based on the energy of waveform segments. if energy < 0.3 , the segment is discarded as silence.

### Feature Extraction ###

* selection of audio feature play an important role to get better accuracy to discriminate between different categories of sounds.
* the extraction should be robust to noise and other background interferences. the filtered segments are split into 16ms frames , and a hamming window is applied to each frame, if the energy of the time sliced segment < 0.01, then the frame is discarded.

### Decision Making ###

two approaches to categorise-
* Decay Factor 
* Band Energy Ratio


**Decay Factor**

* we use short time autocorrelation function to calculate the decay factor. The periodicity of the autocorrelation function indicates if the signal is periodic or not. the autocorrelation quickly falls to zeros in the case of non speech signals or noises. 
* The audio segment is consideered applause/highlight if the decay factor is in the range of 0.6 - 0.8. the extended video/audio segments around that timestamp detected as applause are considered as highlights.


**Band Energy Ratio**

* The Fourier Transform of the signal gives the frequency
content present in the signal. Since different sounds have
different distribution of energy over the frequencies, Fourier
transform can be used to analyze the nature of the signal
* we take 64 bin fast Fourier transform (FFT)
of the signal and take its peak amplitude in the range of 1000
to 5000 Hz i.e. bins 5 to 20 in 64 bins of FFT energy values.
* applause segment has a consistent BER
compared to speech and silence segments.
* The audio segment is consideered applause/highlight if the Band Energy Ratio is in the range of 0.08 - 0.31. The extended video/audio segments around that timestamp detected as applause are considered as highlights.




