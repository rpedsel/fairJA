set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4064, <2> 49.5885, <3> 40.9232, <4> 4.7694, <5> 11.7506, <6> 41.5749, <7> 34.5292, <8> 22.1405, <9> 1.9947, <10> 18.0752, <11> 20.8249, <12> 28.8499, <13> 1.7282, <14> 23.9742, <15> 16.277, <16> 14.5227, <17> 36.216, <18> 22.7068, <19> 32.5761, <20> 48.2316;
param workload[JOB] := <1> 864.7364, <2> 2459.0193, <3> 1674.7083, <4> 22.7472, <5> 138.0766, <6> 1728.4723, <7> 1192.2657, <8> 490.2017, <9> 3.9788, <10> 326.7129, <11> 433.6765, <12> 832.3167, <13> 2.9867, <14> 574.7623, <15> 264.9407, <16> 210.9088, <17> 1311.5987, <18> 515.5988, <19> 1061.2023, <20> 2326.2872;
param capacity[MACHINE] := <1> 16435.1979, <2> 16435.1979, <3> 16435.1979, <4> 16435.1979, <5> 16435.1979, <6> 16435.1979;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
