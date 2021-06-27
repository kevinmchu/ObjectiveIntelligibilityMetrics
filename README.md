# ObjectiveIntelligibilityMetrics
## About
This repository contains code to calculate various objective metrics that are commonly used to predict speech intelligibility in cochlear implant (CI) users.
The following metrics are currently supported:
* envelope correlation-based measure (ECM) (Yousefian and Loizou, 2012)
* hit rate minus false alarm rate (HIT-FA) (Kim et al., 2009)
* root mean squared error (RMSE)
* signal-to-reverberant ratio (SRR)

## Relevant Functions
* `calculateEcm.m`
* `calculateHitFa.m`
* `calculateHitFaPerChannel.m`
* `calculateRmse.m`
* `calculateSrr.m`

### Usage
All of the above functions accept two input arguments: `FTMclean` and `FTMnoisy`. `FTMclean` is the frequency-time decomposition of the clean, anechoic speech signal. `FTMnoisy` represents a speech signal that has been corrupted by either reverberation and/or noise.

## References
* N. Yousefian and P. C. Loizou, “Predicting the speech reception threshold of cochlear implant listeners using an envelope-correlation based measure,” J. Acoust. Soc. Am., vol. 132, no. 5, pp. 3399–3405, 2012.
* G. Kim, Y. Lu, Y. Hu, and P. C. Loizou, “An algorithm that improves speech intelligibility in noise for normal-hearing listeners,” J. Acoust. Soc. Am., vol. 126, no. 3, pp. 1486–1494, 2009.
