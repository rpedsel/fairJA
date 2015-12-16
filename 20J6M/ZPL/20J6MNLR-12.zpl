set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6349, <2> 25.2761, <3> 23.6247, <4> 21.1492, <5> 24.6437, <6> 24.0495, <7> 18.0248, <8> 27.637, <9> 25.3412, <10> 26.3095, <11> 20.5544, <12> 25.9656, <13> 27.7512, <14> 30.9128, <15> 20.3518, <16> 21.7577, <17> 25.9762, <18> 27.8511, <19> 28.4356, <20> 18.8982;
param workload[JOB] := <1> 8.3536, <2> 33.0258, <3> 36.4107, <4> 3.8775, <5> 7.5401, <6> 29.322, <7> 39.2693, <8> 49.7777, <9> 4.0047, <10> 24.8004, <11> 22.9961, <12> 5.7896, <13> 46.7064, <14> 24.7674, <15> 10.7338, <16> 9.9363, <17> 3.1987, <18> 9.0354, <19> 14.7832, <20> 45.3777;
param capacity[MACHINE] := <1> 71.6177, <2> 71.6177, <3> 71.6177, <4> 71.6177, <5> 71.6177, <6> 71.6177;

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
