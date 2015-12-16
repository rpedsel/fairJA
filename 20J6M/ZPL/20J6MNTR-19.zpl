set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.7166, <2> 14.9476, <3> 25.8633, <4> 23.9596, <5> 24.8111, <6> 25.4206, <7> 23.1226, <8> 24.4558, <9> 22.1768, <10> 21.5733, <11> 21.1752, <12> 26.8617, <13> 24.8453, <14> 21.0979, <15> 19.8095, <16> 31.5541, <17> 32.6021, <18> 24.2353, <19> 21.5655, <20> 23.7239;
param workload[JOB] := <1> 43.8348, <2> 45.3403, <3> 43.695, <4> 21.3144, <5> 7.9319, <6> 9.7918, <7> 23.0906, <8> 6.6933, <9> 11.9857, <10> 34.8956, <11> 4.0836, <12> 3.3676, <13> 5.4315, <14> 45.9869, <15> 2.2283, <16> 5.8181, <17> 20.0618, <18> 1.006, <19> 39.2459, <20> 34.9642;
param capacity[MACHINE] := <1> 51.3459, <2> 51.3459, <3> 51.3459, <4> 51.3459, <5> 51.3459, <6> 51.3459;

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
