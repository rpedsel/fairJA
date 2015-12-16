set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.3866, <2> 5.6655, <3> 8.6982, <4> 31.2929, <5> 20.1866, <6> 38.1048, <7> 40.4606, <8> 16.0246, <9> 30.0881, <10> 24.7458, <11> 29.8446, <12> 38.3007, <13> 10.9829, <14> 42.8139, <15> 29.261, <16> 15.8705, <17> 21.8934, <18> 24.9612, <19> 6.5561, <20> 17.6598;
param workload[JOB] := <1> 41.2955, <2> 35.2917, <3> 9.5543, <4> 22.643, <5> 48.4925, <6> 45.6508, <7> 43.2476, <8> 1.6896, <9> 15.1271, <10> 13.7015, <11> 22.184, <12> 15.9703, <13> 43.037, <14> 14.7011, <15> 23.988, <16> 3.4161, <17> 7.649, <18> 33.194, <19> 22.021, <20> 9.4118;
param capacity[MACHINE] := <1> 472.2659, <2> 472.2659, <3> 472.2659, <4> 472.2659, <5> 472.2659, <6> 472.2659;

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
