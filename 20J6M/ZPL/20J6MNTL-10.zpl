set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.0616, <2> 23.6127, <3> 21.6615, <4> 21.8792, <5> 20.3483, <6> 25.712, <7> 29.8282, <8> 22.5653, <9> 30.9604, <10> 26.5401, <11> 20.99, <12> 20.2694, <13> 25.2389, <14> 16.1128, <15> 23.3066, <16> 14.14, <17> 23.9802, <18> 33.8939, <19> 22.1801, <20> 30.1223;
param workload[JOB] := <1> 34.0616, <2> 23.6127, <3> 21.6615, <4> 21.8792, <5> 20.3483, <6> 25.712, <7> 29.8282, <8> 22.5653, <9> 30.9604, <10> 26.5401, <11> 20.99, <12> 20.2694, <13> 25.2389, <14> 16.1128, <15> 23.3066, <16> 14.14, <17> 23.9802, <18> 33.8939, <19> 22.1801, <20> 30.1223;
param capacity[MACHINE] := <1> 60.9254, <2> 60.9254, <3> 60.9254, <4> 60.9254, <5> 60.9254, <6> 60.9254;

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
