set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7716, <2> 21.8485, <3> 30.805, <4> 45.0339, <5> 18.9261, <6> 47.9581, <7> 13.6625, <8> 22.2849, <9> 24.8031, <10> 31.1514, <11> 19.908, <12> 40.2337, <13> 37.2556, <14> 24.635, <15> 23.0363, <16> 28.7927, <17> 13.9891, <18> 36.0748, <19> 38.1805, <20> 40.5475;
param workload[JOB] := <1> 5.7246, <2> 4.6742, <3> 5.5502, <4> 6.7107, <5> 4.3504, <6> 6.9252, <7> 3.6963, <8> 4.7207, <9> 4.9803, <10> 5.5813, <11> 4.4618, <12> 6.343, <13> 6.1037, <14> 4.9634, <15> 4.7996, <16> 5.3659, <17> 3.7402, <18> 6.0062, <19> 6.179, <20> 6.3677;
param capacity[MACHINE] := <1> 107.2444, <2> 107.2444, <3> 107.2444, <4> 107.2444, <5> 107.2444, <6> 107.2444, <7> 107.2444;

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
