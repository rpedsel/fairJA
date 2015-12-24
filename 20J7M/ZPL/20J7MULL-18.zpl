set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.3944, <2> 3.2148, <3> 22.8592, <4> 3.8091, <5> 29.3687, <6> 40.2578, <7> 26.0068, <8> 32.0507, <9> 20.7282, <10> 1.8295, <11> 38.399, <12> 29.0687, <13> 29.3209, <14> 46.6352, <15> 41.7538, <16> 42.4644, <17> 25.7872, <18> 9.869, <19> 46.3515, <20> 0.7121;
param workload[JOB] := <1> 4.3944, <2> 3.2148, <3> 22.8592, <4> 3.8091, <5> 29.3687, <6> 40.2578, <7> 26.0068, <8> 32.0507, <9> 20.7282, <10> 1.8295, <11> 38.399, <12> 29.0687, <13> 29.3209, <14> 46.6352, <15> 41.7538, <16> 42.4644, <17> 25.7872, <18> 9.869, <19> 46.3515, <20> 0.7121;
param capacity[MACHINE] := <1> 70.6973, <2> 70.6973, <3> 70.6973, <4> 70.6973, <5> 70.6973, <6> 70.6973, <7> 70.6973;

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
