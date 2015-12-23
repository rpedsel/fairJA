set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.848, <2> 23.4322, <3> 46.879, <4> 35.3361, <5> 9.6661, <6> 25.9508, <7> 43.6795, <8> 43.8199, <9> 42.3043, <10> 45.1039, <11> 35.3363, <12> 32.4637, <13> 26.8684, <14> 2.2388, <15> 35.3321, <16> 18.8719, <17> 21.4633, <18> 22.8228, <19> 10.8692, <20> 37.9979;
param workload[JOB] := <1> 5.2771, <2> 4.8407, <3> 6.8468, <4> 5.9444, <5> 3.109, <6> 5.0942, <7> 6.609, <8> 6.6197, <9> 6.5042, <10> 6.7159, <11> 5.9444, <12> 5.6977, <13> 5.1835, <14> 1.4963, <15> 5.9441, <16> 4.3442, <17> 4.6329, <18> 4.7773, <19> 3.2968, <20> 6.1642;
param capacity[MACHINE] := <1> 105.0424, <2> 105.0424, <3> 105.0424, <4> 105.0424, <5> 105.0424, <6> 105.0424, <7> 105.0424;

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
