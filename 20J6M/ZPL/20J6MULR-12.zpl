set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5656, <2> 35.9836, <3> 30.1583, <4> 24.7967, <5> 38.19, <6> 26.4943, <7> 47.7237, <8> 37.6601, <9> 25.7405, <10> 45.5087, <11> 10.8934, <12> 19.1846, <13> 40.3771, <14> 10.5435, <15> 32.5294, <16> 11.8598, <17> 15.3995, <18> 38.8919, <19> 22.2753, <20> 9.9505;
param workload[JOB] := <1> 39.2542, <2> 42.2246, <3> 41.6962, <4> 45.5542, <5> 36.4621, <6> 31.6105, <7> 45.1288, <8> 14.026, <9> 35.3487, <10> 6.2133, <11> 37.8712, <12> 2.8138, <13> 37.0623, <14> 33.435, <15> 34.4252, <16> 40.4573, <17> 25.8973, <18> 45.9242, <19> 16.4367, <20> 35.3565;
param capacity[MACHINE] := <1> 107.8664, <2> 107.8664, <3> 107.8664, <4> 107.8664, <5> 107.8664, <6> 107.8664;

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
