set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3527, <2> 39.2226, <3> 9.9332, <4> 26.1126, <5> 49.2207, <6> 44.6075, <7> 12.7756, <8> 48.4832, <9> 43.37, <10> 4.1404, <11> 3.7772, <12> 44.1525, <13> 3.4615, <14> 4.2039, <15> 31.5458, <16> 34.2326, <17> 3.0282, <18> 23.1896, <19> 15.683, <20> 29.2528;
param workload[JOB] := <1> 5.0351, <2> 6.2628, <3> 3.1517, <4> 5.11, <5> 7.0157, <6> 6.6789, <7> 3.5743, <8> 6.963, <9> 6.5856, <10> 2.0348, <11> 1.9435, <12> 6.6447, <13> 1.8605, <14> 2.0503, <15> 5.6166, <16> 5.8509, <17> 1.7402, <18> 4.8156, <19> 3.9602, <20> 5.4086;
param capacity[MACHINE] := <1> 13.1861, <2> 13.1861, <3> 13.1861, <4> 13.1861, <5> 13.1861, <6> 13.1861, <7> 13.1861;

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
