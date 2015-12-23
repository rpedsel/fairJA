set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.6361, <2> 24.2939, <3> 45.9194, <4> 23.5532, <5> 7.0693, <6> 0.274, <7> 35.6894, <8> 17.4174, <9> 39.2528, <10> 48.6515, <11> 47.5941, <12> 40.5184, <13> 37.7566, <14> 40.1304, <15> 19.7047, <16> 30.0328, <17> 43.7498, <18> 9.4277, <19> 38.512, <20> 45.1914;
param workload[JOB] := <1> 16.441, <2> 2.5519, <3> 33.54, <4> 6.8285, <5> 27.5053, <6> 26.1905, <7> 25.0763, <8> 24.1269, <9> 26.15, <10> 27.848, <11> 29.2795, <12> 2.2885, <13> 5.1894, <14> 49.8559, <15> 18.165, <16> 7.8913, <17> 49.239, <18> 41.548, <19> 6.306, <20> 15.9543;
param capacity[MACHINE] := <1> 63.1393, <2> 63.1393, <3> 63.1393, <4> 63.1393, <5> 63.1393, <6> 63.1393, <7> 63.1393;

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
