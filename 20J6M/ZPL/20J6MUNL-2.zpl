set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.3176, <2> 37.7604, <3> 34.0828, <4> 39.5424, <5> 9.8797, <6> 0.8543, <7> 32.8627, <8> 48.1368, <9> 15.4172, <10> 39.7689, <11> 20.0577, <12> 14.7121, <13> 36.0677, <14> 47.3499, <15> 32.7043, <16> 32.4628, <17> 14.1084, <18> 39.4796, <19> 26.7361, <20> 41.2292;
param workload[JOB] := <1> 7.3176, <2> 37.7604, <3> 34.0828, <4> 39.5424, <5> 9.8797, <6> 0.8543, <7> 32.8627, <8> 48.1368, <9> 15.4172, <10> 39.7689, <11> 20.0577, <12> 14.7121, <13> 36.0677, <14> 47.3499, <15> 32.7043, <16> 32.4628, <17> 14.1084, <18> 39.4796, <19> 26.7361, <20> 41.2292;
param capacity[MACHINE] := <1> 570.5306, <2> 570.5306, <3> 570.5306, <4> 570.5306, <5> 570.5306, <6> 570.5306;

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
