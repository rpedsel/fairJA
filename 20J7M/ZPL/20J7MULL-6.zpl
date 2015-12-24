set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.0785, <2> 27.9873, <3> 15.6005, <4> 38.3473, <5> 13.7988, <6> 8.8907, <7> 0.5202, <8> 5.4896, <9> 6.3703, <10> 9.2628, <11> 0.5487, <12> 28.673, <13> 15.0791, <14> 7.5288, <15> 13.9779, <16> 0.0922, <17> 11.7608, <18> 39.0089, <19> 41.5679, <20> 32.0059;
param workload[JOB] := <1> 40.0785, <2> 27.9873, <3> 15.6005, <4> 38.3473, <5> 13.7988, <6> 8.8907, <7> 0.5202, <8> 5.4896, <9> 6.3703, <10> 9.2628, <11> 0.5487, <12> 28.673, <13> 15.0791, <14> 7.5288, <15> 13.9779, <16> 0.0922, <17> 11.7608, <18> 39.0089, <19> 41.5679, <20> 32.0059;
param capacity[MACHINE] := <1> 50.9413, <2> 50.9413, <3> 50.9413, <4> 50.9413, <5> 50.9413, <6> 50.9413, <7> 50.9413;

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
