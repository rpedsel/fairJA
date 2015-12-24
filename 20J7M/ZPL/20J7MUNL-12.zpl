set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.1954, <2> 16.631, <3> 7.2126, <4> 14.2348, <5> 6.8144, <6> 18.5916, <7> 48.5785, <8> 35.0604, <9> 22.3296, <10> 24.4592, <11> 47.4534, <12> 6.4074, <13> 9.4573, <14> 39.32, <15> 17.2509, <16> 35.4574, <17> 1.691, <18> 48.4961, <19> 17.488, <20> 2.34;
param workload[JOB] := <1> 12.1954, <2> 16.631, <3> 7.2126, <4> 14.2348, <5> 6.8144, <6> 18.5916, <7> 48.5785, <8> 35.0604, <9> 22.3296, <10> 24.4592, <11> 47.4534, <12> 6.4074, <13> 9.4573, <14> 39.32, <15> 17.2509, <16> 35.4574, <17> 1.691, <18> 48.4961, <19> 17.488, <20> 2.34;
param capacity[MACHINE] := <1> 431.469, <2> 431.469, <3> 431.469, <4> 431.469, <5> 431.469, <6> 431.469, <7> 431.469;

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
