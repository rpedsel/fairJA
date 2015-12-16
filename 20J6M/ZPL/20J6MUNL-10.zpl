set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0818, <2> 40.8585, <3> 15.511, <4> 7.0646, <5> 47.2958, <6> 45.8052, <7> 31.2283, <8> 13.3079, <9> 18.4162, <10> 30.3778, <11> 7.4659, <12> 37.9718, <13> 14.5987, <14> 16.8386, <15> 16.7324, <16> 39.515, <17> 11.0006, <18> 31.6019, <19> 46.6061, <20> 1.7009;
param workload[JOB] := <1> 20.0818, <2> 40.8585, <3> 15.511, <4> 7.0646, <5> 47.2958, <6> 45.8052, <7> 31.2283, <8> 13.3079, <9> 18.4162, <10> 30.3778, <11> 7.4659, <12> 37.9718, <13> 14.5987, <14> 16.8386, <15> 16.7324, <16> 39.515, <17> 11.0006, <18> 31.6019, <19> 46.6061, <20> 1.7009;
param capacity[MACHINE] := <1> 493.979, <2> 493.979, <3> 493.979, <4> 493.979, <5> 493.979, <6> 493.979;

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
