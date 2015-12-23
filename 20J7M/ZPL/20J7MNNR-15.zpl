set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3096, <2> 24.907, <3> 34.9289, <4> 17.3476, <5> 12.7749, <6> 23.0293, <7> 20.8652, <8> 27.9566, <9> 39.034, <10> 29.7949, <11> 35.9813, <12> 26.6478, <13> 14.2641, <14> 23.1773, <15> 25.7831, <16> 24.4464, <17> 26.0373, <18> 27.3412, <19> 20.8405, <20> 22.772;
param workload[JOB] := <1> 13.1215, <2> 3.794, <3> 16.1247, <4> 45.5676, <5> 25.4826, <6> 9.1769, <7> 33.8331, <8> 21.5602, <9> 29.5381, <10> 22.3123, <11> 42.6598, <12> 46.8224, <13> 45.4405, <14> 19.1915, <15> 9.5751, <16> 10.5382, <17> 2.8384, <18> 9.0165, <19> 41.9377, <20> 29.1003;
param capacity[MACHINE] := <1> 477.6314, <2> 477.6314, <3> 477.6314, <4> 477.6314, <5> 477.6314, <6> 477.6314, <7> 477.6314;

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