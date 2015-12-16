set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0482, <2> 29.4289, <3> 23.511, <4> 32.5604, <5> 21.4381, <6> 18.2267, <7> 25.2486, <8> 33.5678, <9> 20.9582, <10> 19.3275, <11> 20.0288, <12> 27.4277, <13> 27.2998, <14> 30.7755, <15> 25.8418, <16> 27.715, <17> 26.6398, <18> 17.6032, <19> 28.7281, <20> 24.6895;
param workload[JOB] := <1> 29.0482, <2> 29.4289, <3> 23.511, <4> 32.5604, <5> 21.4381, <6> 18.2267, <7> 25.2486, <8> 33.5678, <9> 20.9582, <10> 19.3275, <11> 20.0288, <12> 27.4277, <13> 27.2998, <14> 30.7755, <15> 25.8418, <16> 27.715, <17> 26.6398, <18> 17.6032, <19> 28.7281, <20> 24.6895;
param capacity[MACHINE] := <1> 63.7581, <2> 63.7581, <3> 63.7581, <4> 63.7581, <5> 63.7581, <6> 63.7581;

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
