set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.319, <2> 9.0529, <3> 3.2677, <4> 4.6719, <5> 2.9146, <6> 20.0361, <7> 19.8085, <8> 19.2238, <9> 46.6186, <10> 43.4347, <11> 0.7988, <12> 18.7636, <13> 4.711, <14> 40.7013, <15> 19.5289, <16> 10.0513, <17> 29.3071, <18> 15.9475, <19> 13.4518, <20> 44.9638;
param workload[JOB] := <1> 25.319, <2> 9.0529, <3> 3.2677, <4> 4.6719, <5> 2.9146, <6> 20.0361, <7> 19.8085, <8> 19.2238, <9> 46.6186, <10> 43.4347, <11> 0.7988, <12> 18.7636, <13> 4.711, <14> 40.7013, <15> 19.5289, <16> 10.0513, <17> 29.3071, <18> 15.9475, <19> 13.4518, <20> 44.9638;
param capacity[MACHINE] := <1> 392.5729, <2> 392.5729, <3> 392.5729, <4> 392.5729, <5> 392.5729, <6> 392.5729;

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
