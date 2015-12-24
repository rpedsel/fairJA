set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9773, <2> 30.402, <3> 24.4324, <4> 17.7911, <5> 28.4488, <6> 15.2863, <7> 32.8071, <8> 21.2467, <9> 20.7533, <10> 26.473, <11> 24.115, <12> 20.2557, <13> 24.3815, <14> 32.5372, <15> 26.1789, <16> 25.8455, <17> 25.2013, <18> 24.078, <19> 22.5677, <20> 17.9329;
param workload[JOB] := <1> 4.9977, <2> 5.5138, <3> 4.9429, <4> 4.2179, <5> 5.3337, <6> 3.9098, <7> 5.7277, <8> 4.6094, <9> 4.5556, <10> 5.1452, <11> 4.9107, <12> 4.5006, <13> 4.9378, <14> 5.7041, <15> 5.1165, <16> 5.0838, <17> 5.0201, <18> 4.9069, <19> 4.7505, <20> 4.2347;
param capacity[MACHINE] := <1> 10.5128, <2> 10.5128, <3> 10.5128, <4> 10.5128, <5> 10.5128, <6> 10.5128, <7> 10.5128;

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
