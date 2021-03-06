set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.4488, <2> 48.0544, <3> 32.6467, <4> 49.0663, <5> 7.9883, <6> 6.2864, <7> 11.7241, <8> 15.9764, <9> 16.9795, <10> 30.0924, <11> 42.1282, <12> 32.3794, <13> 7.2933, <14> 16.2944, <15> 45.0141, <16> 42.8312, <17> 19.9286, <18> 11.1912, <19> 9.7736, <20> 29.4537;
param workload[JOB] := <1> 2445.1838, <2> 2309.2254, <3> 1065.807, <4> 2407.5018, <5> 63.8129, <6> 39.5188, <7> 137.4545, <8> 255.2454, <9> 288.3034, <10> 905.5525, <11> 1774.7852, <12> 1048.4255, <13> 53.1922, <14> 265.5075, <15> 2026.2692, <16> 1834.5117, <17> 397.1491, <18> 125.243, <19> 95.5233, <20> 867.5204;
param capacity[MACHINE] := <1> 18405.7326, <2> 18405.7326, <3> 18405.7326, <4> 18405.7326, <5> 18405.7326, <6> 18405.7326, <7> 18405.7326;

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
